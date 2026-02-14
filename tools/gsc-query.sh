#!/bin/bash
# gsc-query.sh — Consultas a Google Search Console API
# Uso: ./gsc-query.sh [endpoint] [parámetros]

SITE="https://tourexperto.com/"
SITE_ENCODED=$(printf '%s' "$SITE" | jq -sRr @uri)

# Token (reemplazar con el actual o exportar como variable)
ACCESS_TOKEN="${GSC_TOKEN:-ya29.a0AUMWg_J7BGqyV35DSL6uEiTo2d7h5DdU3zjiKqCJjYUA9ObqNMLcJ2hX2H6AGW8G36uRhJ6rWsCdZpnGMT-VYFzcJvnVtpzaAiNIiTUt_1AWBrOlZBsdT9eW0NABiMZGzjTByIIGAcnz-6OMp2ekxytPoEsVlkiTr4IDXLDeEigl17TCYEHTRpnuVyiWXiIlx9-dP6MaCgYKAXwSARcSFQHGX2MiaF45PtxFAXQoTnQNuX6Rog0206}"

BASE_URL="https://www.googleapis.com/webmasters/v3/sites/${SITE_ENCODED}"

# Función: Listar sitios verificados
list_sites() {
  curl -s "https://www.googleapis.com/webmasters/v3/sites?access_token=${ACCESS_TOKEN}" | jq .
}

# Función: Search Analytics (consultas, clicks, impresiones)
search_analytics() {
  local start_date="${1:-2025-01-01}"
  local end_date="${2:-2025-02-13}"
  
  curl -s "${BASE_URL}/searchAnalytics/query?access_token=${ACCESS_TOKEN}" \
    -X POST \
    -H "Content-Type: application/json" \
    -d "{
      \"startDate\": \"${start_date}\",
      \"endDate\": \"${end_date}\",
      \"dimensions\": [\"query\", \"page\"],
      \"rowLimit\": 100,
      \"startRow\": 0
    }" | jq .
}

# Función: Errores de rastreo (crítico para TourExperto)
crawl_errors() {
  curl -s "${BASE_URL}/urlCrawlErrorsCounts/query?access_token=${ACCESS_TOKEN}" | jq .
}

# Función: Detalle de errores por categoría
error_samples() {
  local category="${1:-notFound}"  # notFound, serverError, soft404, etc.
  local platform="${2:-web}"       # web, mobile, smartphone
  
  curl -s "${BASE_URL}/urlCrawlErrorsSamples/${category}?platform=${platform}&access_token=${ACCESS_TOKEN}" | jq .
}

# Función: Sitemaps
list_sitemaps() {
  curl -s "${BASE_URL}/sitemaps?access_token=${ACCESS_TOKEN}" | jq .
}

# Main
case "${1:-help}" in
  sites)
    list_sites
    ;;
  analytics|search)
    search_analytics "$2" "$3"
    ;;
  errors|crawl)
    crawl_errors
    ;;
  error-samples|samples)
    error_samples "$2" "$3"
    ;;
  sitemaps)
    list_sitemaps
    ;;
  help|*)
    echo "Uso: $0 [comando] [opciones]"
    echo ""
    echo "Comandos:"
    echo "  sites                    — Listar sitios verificados"
    echo "  analytics [start] [end]  — Search Analytics (default: 2025-01-01 a 2025-02-13)"
    echo "  errors                   — Resumen de errores de rastreo"
    echo "  error-samples [cat]      — URLs con errores (cat: notFound, serverError, soft404)"
    echo "  sitemaps                 — Listar sitemaps enviados"
    echo ""
    echo "Ejemplos:"
    echo "  $0 errors                                    # Ver errores de rastreo"
    echo "  $0 error-samples soft404                     # Ver soft 404s"
    echo "  $0 analytics 2025-02-01 2025-02-13           # Analytics últimas 2 semanas"
    ;;
esac
