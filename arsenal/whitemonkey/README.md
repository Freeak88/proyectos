# 🤖 Whitemonkey — Nodo Maestro

> Dispositivo principal de Damian. Nodo de automatización, scraping e IA local.

---

## 🆔 Identidad

| Atributo | Valor |
|----------|-------|
| **Hostname** | whitemonkey |
| **IP Tailscale** | 100.73.185.25 |
| **Propietario** | Damian Ferraro |
| **Rol** | Nodo Maestro de Automatización, Web Scraping y AI Local |
| **OS** | Windows 11 |

---

## 🛠 Hardware

| Componente | Especificación |
|------------|----------------|
| **CPU** | Intel Core i7-12700 (12th Gen) — 12 núcleos / 20 hilos |
| **RAM** | 32 GB DDR4/DDR5 |
| **GPU Primaria (AI)** | AMD Radeon RX 6700 XT (ROCm/HIP optimizada) |
| **GPU Integrada** | Intel UHD Graphics 770 |
| **Almacenamiento** | Arquitectura híbrida + MinIO para volúmenes grandes |

---

## 💻 Software Stack

| Categoría | Versión/Detalle |
|-----------|-----------------|
| **Sistema Operativo** | Windows 11 (Kernel NT) |
| **Node.js** | v22.19.0 |
| **Docker Engine** | 27.x.x |
| **Gestores de paquetes** | npm, pnpm |
| **CLI Tools** | PowerShell, Tailscale CLI, Docker CLI |

---

## 🚀 Servicios Activos

### 🕷 Maxun Stack (Scraping)

| Servicio | Puerto | URL Tailscale | Estado |
|----------|--------|---------------|--------|
| Frontend | 5173 | http://100.73.185.25:5173 | Activo |
| Backend | 8080 | http://100.73.185.25:8080 | Activo |
| PostgreSQL | 5433 | localhost:5433 | Activo |
| MinIO | 9000/9001 | localhost:9000 | Activo |
| Browser (Chromium) | — | — | Renderizado inteligente |

**Path del proyecto:** `D:\Repos\maxun`

**Comandos útiles:**
```powershell
# Iniciar
D:\Repos\maxun; docker-compose up -d

# Detener
D:\Repos\maxun; docker-compose stop

# Logs
D:\Repos\maxun; docker-compose logs -f backend
```

---

### 🗄 Supabase Stack

Instalación local completa:
- Auth
- Edge Functions
- Realtime
- Vector
- Analytics
- Storage
- Imgproxy

---

### 💬 Chatwoot

Instancia local de atención al cliente (omnicanalidad).
- PostgreSQL + Redis

---

### 🧠 Ollama (IA Local)

**Servicio:** Inferencia de LLMs locales via GPU AMD

**Modelos disponibles:**
- `qwen3:8b` (4.9 GB) — Rápido, balanceado
- `qwen3:8b-limited` (4.9 GB) — Versión limitada
- `gemma3:12b` (7.6 GB) — Más potente, más lento
- `gpt-4o-mini:latest` (4.9 GB) — Alias local
- `local-model:latest` (4.9 GB) — Alias local

**Endpoint:** http://100.73.185.25:11434

**Hardware:** ROCm/HIP para máxima eficiencia en RX 6700 XT

**Uso típico:**
```bash
curl http://100.73.185.25:11434/api/generate -d '{
  "model": "qwen3:8b",
  "prompt": "Hola",
  "stream": false
}'
```

---

## 🌐 Conectividad

### Tailscale

**IP:** 100.73.185.25
**Nombre:** whitemonkey
**Función:** Puente seguro entre dispositivos

**Dispositivos conectados:**
- freeakplus
- kali
- vps-hostinger
- etc.

### Acceso Remoto

- Escritorio remoto configurado via Tailscale IP

---

## 📊 Gestión de Recursos

| Recurso | Uso típico | Pico |
|---------|------------|------|
| GPU (RX 6700 XT) | 40-60% | 80% (gemma3:12b) |
| VRAM | 5-9 GB | 11 GB (casi límite) |
| RAM del sistema | Variable | Depende de Maxun + Ollama |

### Conflictos conocidos:
- Maxun (scraping intensivo) + Ollama (inferencia) = posible cuello de botella en CPU/RAM
- Solución: scheduling manual o automático (encender/apagar servicios según demanda)

---

## 🔐 Acceso para Aletheia

| Método | Estado | Detalle |
|--------|--------|---------|
| Tailscale SSH | Pendiente | `tailscale up --ssh` |
| Docker Context | Pendiente | Requiere SSH primero |
| API Key Maxun | ✅ Activa | `fXZVc9bd375Z9RHivdxAhLqHgXnOXXnA` |

---

*Última actualización: 14/02/2026*
