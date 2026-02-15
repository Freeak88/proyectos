#!/bin/bash
# Script de configuración NVIDIA Kimi K2.5 para Lean
# Este script configura el acceso al modelo gratuito de NVIDIA
# Fecha: 15/02/2026

set -e

echo "🚀 Configuración de NVIDIA Kimi K2.5 para OpenClaw"
echo "================================================"
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar si se proporcionó API key
if [ -z "$1" ]; then
    echo -e "${RED}Error: Debes proporcionar la API key de NVIDIA${NC}"
    echo "Uso: ./configurar-lean.sh <API_KEY>"
    echo ""
    echo "Obtén tu API key gratuita en: https://build.nvidia.com/settings/api-keys"
    exit 1
fi

API_KEY="$1"

# Detectar sistema operativo
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS="windows"
else
    echo -e "${YELLOW}Sistema operativo no detectado claramente, asumiendo Linux${NC}"
    OS="linux"
fi

echo -e "${GREEN}Sistema detectado: $OS${NC}"
echo ""

# Crear directorio de configuración si no existe
CONFIG_DIR="$HOME/.openclaw"
mkdir -p "$CONFIG_DIR"

echo "📁 Configurando directorio: $CONFIG_DIR"

# Backup de configuración anterior si existe
if [ -f "$CONFIG_DIR/openclaw.json" ]; then
    echo "💾 Backup de configuración anterior..."
    cp "$CONFIG_DIR/openclaw.json" "$CONFIG_DIR/openclaw.json.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Crear configuración nueva
echo "⚙️  Creando configuración con NVIDIA Kimi K2.5..."

cat > "$CONFIG_DIR/openclaw.json" << EOF
{
  "version": "1.0",
  "description": "Configuración Lean - NVIDIA Kimi K2.5 Gratuito",
  
  "providers": {
    "nvidia": {
      "base_url": "https://integrate.api.nvidia.com/v1",
      "api_key": "${API_KEY}",
      "default_model": "moonshotai/kimi-k2.5",
      "timeout": 60
    }
  },

  "agents": {
    "defaults": {
      "model": {
        "provider": "nvidia",
        "model": "moonshotai/kimi-k2.5",
        "base_url": "https://integrate.api.nvidia.com/v1",
        "api_key": "${API_KEY}",
        "temperature": 0.7,
        "max_tokens": 4000
      },
      "context_window": 80000,
      "reserve_tokens_floor": 0
    },
    
    "heartbeat": {
      "enabled": true,
      "interval": "45m",
      "provider": "nvidia",
      "model": "moonshotai/kimi-k2.5",
      "silent_hours": {
        "start": "23:00",
        "end": "08:00"
      }
    },

    "subagents": {
      "provider": "nvidia",
      "model": "moonshotai/kimi-k2.5",
      "max_concurrent": 2
    }
  },

  "budget": {
    "daily_limit_usd": 1.00,
    "alert_threshold": 0.80,
    "hard_stop": true
  },

  "context": {
    "contextTokens": 80000,
    "reserveTokensFloor": 0,
    "cache_ttl": "6h"
  }
}
EOF

echo -e "${GREEN}✅ Configuración creada en: $CONFIG_DIR/openclaw.json${NC}"
echo ""

# Configurar variables de entorno (opcional pero recomendado)
echo "📝 Configurando variables de entorno..."

SHELL_RC=""
if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.profile" ]; then
    SHELL_RC="$HOME/.profile"
fi

if [ -n "$SHELL_RC" ]; then
    # Verificar si ya existe
    if ! grep -q "NVIDIA_API_KEY" "$SHELL_RC" 2>/dev/null; then
        echo "" >> "$SHELL_RC"
        echo "# NVIDIA API Key para OpenClaw" >> "$SHELL_RC"
        echo "export NVIDIA_API_KEY=\"${API_KEY}\"" >> "$SHELL_RC"
        echo "export NVIDIA_BASE_URL=\"https://integrate.api.nvidia.com/v1\"" >> "$SHELL_RC"
        echo -e "${GREEN}✅ Variables de entorno agregadas a: $SHELL_RC${NC}"
    else
        echo -e "${YELLOW}⚠️  Variables de entorno ya existen en $SHELL_RC${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  No se detectó archivo de configuración de shell${NC}"
    echo "Agrega manualmente estas variables:"
    echo "export NVIDIA_API_KEY=\"${API_KEY}\""
    echo "export NVIDIA_BASE_URL=\"https://integrate.api.nvidia.com/v1\""
fi

echo ""

# Verificar conexión con NVIDIA API
echo "🧪 Probando conexión con NVIDIA API..."
echo ""

HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer ${API_KEY}" \
    -H "Content-Type: application/json" \
    https://integrate.api.nvidia.com/v1/models 2>/dev/null || echo "000")

if [ "$HTTP_RESPONSE" = "200" ]; then
    echo -e "${GREEN}✅ Conexión con NVIDIA API exitosa!${NC}"
    echo ""
    echo "Modelos disponibles:"
    curl -s -H "Authorization: Bearer ${API_KEY}" \
        https://integrate.api.nvidia.com/v1/models | \
        grep -o '"id":"[^"]*"' | \
        head -5 | \
        sed 's/"id":"/  - /g; s/"//g' || echo "  (No se pudieron listar modelos, pero la conexión funciona)"
elif [ "$HTTP_RESPONSE" = "401" ]; then
    echo -e "${RED}❌ Error de autenticación. Verifica que la API key sea correcta.${NC}"
    exit 1
elif [ "$HTTP_RESPONSE" = "000" ]; then
    echo -e "${YELLOW}⚠️  No se pudo conectar a NVIDIA API. Posible problema de red.${NC}"
    echo "   La configuración se guardó igual, intenta de nuevo más tarde."
else
    echo -e "${YELLOW}⚠️  Respuesta inesperada (HTTP $HTTP_RESPONSE).${NC}"
    echo "   La configuración se guardó, pero verifica la conexión."
fi

echo ""
echo "================================================"
echo -e "${GREEN}🎉 Configuración completada para Lean!${NC}"
echo ""
echo "📋 Resumen:"
echo "  - Modelo principal: moonshotai/kimi-k2.5 (NVIDIA)"
echo "  - Costo: $0.00 (gratuito)"
echo "  - Límite diario: $1.00 (por seguridad)"
echo "  - Silent hours: 23:00 - 08:00"
echo ""
echo "🔄 Para aplicar los cambios:"
echo "   1. Reiniciar OpenClaw: openclaw restart"
echo "   2. O recargar shell: source $SHELL_RC"
echo ""
echo "🧪 Prueba de funcionamiento:"
echo "   openclaw status"
echo ""
echo "📁 Configuración guardada en:"
echo "   $CONFIG_DIR/openclaw.json"
echo ""
