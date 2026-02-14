#!/bin/bash
# gsc-refresh-token.sh — Refrescar token de GSC cuando expire
# Uso: GSC_REFRESH_TOKEN=<token> ./gsc-refresh-token.sh

CLIENT_ID="${GSC_CLIENT_ID:-}"      # Google Cloud Console OAuth Client ID
CLIENT_SECRET="${GSC_CLIENT_SECRET:-}"  # Google Cloud Console OAuth Client Secret
REFRESH_TOKEN="${GSC_REFRESH_TOKEN:-}"   # Exportar refresh token como variable

if [ -z "$REFRESH_TOKEN" ]; then
  echo "⚠️  Variable GSC_REFRESH_TOKEN no definida"
  echo ""
  echo "📋 Alternativa manual:"
  echo "   1. Ir a: https://developers.google.com/oauthplayground"
  echo "   2. Seleccionar scope: https://www.googleapis.com/auth/webmasters.readonly"
  echo "   3. Generar tokens y copiar access_token"
  exit 1
fi

echo "🔄 Refrescando token de GSC..."

RESPONSE=$(curl -s -X POST https://oauth2.googleapis.com/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=${CLIENT_ID}" \
  -d "client_secret=${CLIENT_SECRET}" \
  -d "refresh_token=${REFRESH_TOKEN}" \
  -d "grant_type=refresh_token")

NEW_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token // empty')

if [ -n "$NEW_TOKEN" ]; then
  echo "✅ Nuevo token obtenido:"
  echo "$NEW_TOKEN"
  echo ""
  echo "💾 Exportar para usar:"
  echo "   export GSC_TOKEN='$NEW_TOKEN'"
else
  echo "❌ Error al refrescar:"
  echo "$RESPONSE" | jq .
fi
