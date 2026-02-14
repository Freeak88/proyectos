#!/bin/bash
# gsc-tourexperto-audit.sh — Auditoría específica para TourExperto post-migración
# Requiere: GSC_TOKEN exportado o pasado como argumento

set -e

SITE="https://tourexperto.com/"
SITE_ENCODED=$(printf '%s' "$SITE" | jq -sRr @uri)
ACCESS_TOKEN="${1:-$GSC_TOKEN}"

if [ -z "$ACCESS_TOKEN" ]; then
  echo "❌ Error: Token no proporcionado"
  echo "Uso: $0 <access_token>"
  echo "   o: GSC_TOKEN=<token> $0"
  exit 1
fi

BASE_URL="https://www.googleapis.com/webmasters/v3/sites/${SITE_ENCODED}"
OUTPUT_DIR="${HOME}/gsc-reports"
mkdir -p "$OUTPUT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
REPORT_FILE="$OUTPUT_DIR/tourexperto_audit_${TIMESTAMP}.json"

echo "🔍 Auditoría GSC para TourExperto"
echo "📅 Fecha: $(date)"
echo "📁 Reporte: $REPORT_FILE"
echo ""

# 1. Errores de rastreo (crítico para migración)
echo "📊 1. Obteniendo errores de rastreo..."
CURL_ERRORS=$(curl -s "${BASE_URL}/urlCrawlErrorsCounts/query?access_token=${ACCESS_TOKEN}")
echo "$CURL_ERRORS" | jq '.countPerStatus // "No data"'

# 2. Soft 404s (mencionados en mails como problema grave)
echo ""
echo "📄 2. URLs con Soft 404..."
SOFT404=$(curl -s "${BASE_URL}/urlCrawlErrorsSamples/soft404?platform=web&access_token=${ACCESS_TOKEN}")
echo "$SOFT404" | jq '.urlCrawlErrorSample | length // 0' | xargs echo "   Total Soft 404s encontrados:"

# 3. Errores de servidor (500s — mencionados en mails de Perú/Italia)
echo ""
echo "🔥 3. URLs con errores de servidor (500)..."
SERVER_ERRORS=$(curl -s "${BASE_URL}/urlCrawlErrorsSamples/serverError?platform=web&access_token=${ACCESS_TOKEN}")
echo "$SERVER_ERRORS" | jq '.urlCrawlErrorSample | length // 0' | xargs echo "   Total errores 500 encontrados:"

# 4. Not Found (404s normales)
echo ""
echo "❌ 4. URLs con Not Found (404)..."
NOTFOUND=$(curl -s "${BASE_URL}/urlCrawlErrorsSamples/notFound?platform=web&access_token=${ACCESS_TOKEN}")
echo "$NOTFOUND" | jq '.urlCrawlErrorSample | length // 0' | xargs echo "   Total 404s encontrados:"

# 5. Analytics últimos 30 días (para ver impacto SEO)
echo ""
echo "📈 5. Search Analytics (últimos 30 días)..."
END_DATE=$(date +%Y-%m-%d)
START_DATE=$(date -d "30 days ago" +%Y-%m-%d 2>/dev/null || date -v-30d +%Y-%m-%d)

ANALYTICS=$(curl -s "${BASE_URL}/searchAnalytics/query?access_token=${ACCESS_TOKEN}" \
  -X POST \
  -H "Content-Type: application/json" \
  -d "{
    \"startDate\": \"${START_DATE}\",
    \"endDate\": \"${END_DATE}\",
    \"dimensions\": [\"page\"],
    \"rowLimit\": 50,
    \"aggregationType\": \"byPage\"
  }")

CLICKS=$(echo "$ANALYTICS" | jq '[.rows[].clicks // 0] | add // 0')
IMPRESSIONS=$(echo "$ANALYTICS" | jq '[.rows[].impressions // 0] | add // 0')
echo "   Clicks totales: $CLICKS"
echo "   Impresiones totales: $IMPRESSIONS"

# Guardar reporte completo
echo ""
echo "💾 Guardando reporte completo..."
cat > "$REPORT_FILE" << EOF
{
  "audit_date": "$(date -Iseconds)",
  "site": "$SITE",
  "crawl_errors": $CURL_ERRORS,
  "soft404_samples": $SOFT404,
  "server_errors": $SERVER_ERRORS,
  "notfound_samples": $NOTFOUND,
  "analytics_30d": {
    "period": "$START_DATE a $END_DATE",
    "data": $ANALYTICS
  }
}
EOF

echo ""
echo "✅ Auditoría completa"
echo "📄 Reporte guardado en: $REPORT_FILE"
echo ""
echo "💡 Próximos pasos:"
echo "   - Revisar soft 404s: jq '.soft404_samples.urlCrawlErrorSample[].pageUrl' $REPORT_FILE"
echo "   - Revisar errores 500: jq '.server_errors.urlCrawlErrorSample[].pageUrl' $REPORT_FILE"
echo "   - Verificar que las redirecciones 301 no apunten a URLs con error"
