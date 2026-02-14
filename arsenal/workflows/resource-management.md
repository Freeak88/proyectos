# 🔄 Workflows de Recursos

> Flujos de trabajo para gestionar el uso compartido de recursos en whitemonkey.

---

## Contenido Extenso con Ollama

### Escenario: Generar artículo de 1200-1400 palabras

```
┌─────────────────────────────────────────────────────────────┐
│  1. CHECK: ¿Maxun está corriendo?                           │
│     ├── Sí → Guardar estado + detener                        │
│     └── No → Continuar                                       │
├─────────────────────────────────────────────────────────────┤
│  2. GENERATE: Usar Ollama (qwen3:8b preferido)              │
│     ├── Prompt 1: Introducción (200 palabras)               │
│     ├── Prompt 2: Desarrollo punto 1 (300 palabras)         │
│     ├── Prompt 3: Desarrollo punto 2 (300 palabras)         │
│     ├── Prompt 4: Desarrollo punto 3 (300 palabras)         │
│     └── Prompt 5: Conclusión (150 palabras)                 │
├─────────────────────────────────────────────────────────────┤
│  3. ASSEMBLE: Verificar coherencia entre chunks             │
├─────────────────────────────────────────────────────────────┤
│  4. RESUME: Reanudar Maxun si estaba activo                 │
└─────────────────────────────────────────────────────────────┘
```

**Tiempo estimado:** 2-3 minutos total (qwen3:8b)

---

## Scraping Masivo con Maxun

### Escenario: Extracción de datos a gran escala

```
┌─────────────────────────────────────────────────────────────┐
│  1. CHECK: ¿Ollama está generando contenido?                │
│     ├── Sí → Esperar o coordinar                             │
│     └── No → Continuar                                       │
├─────────────────────────────────────────────────────────────┤
│  2. CONFIGURE: Limitar concurrencia de Maxun                │
│     └── Ajustar workers para dejar margen de GPU            │
├─────────────────────────────────────────────────────────────┤
│  3. EXECUTE: Iniciar jobs de scraping                       │
├─────────────────────────────────────────────────────────────┤
│  4. MONITOR: Verificar uso de recursos                      │
└─────────────────────────────────────────────────────────────┘
```

---

## Prioridad de Recursos

| Prioridad | Servicio | Condición |
|-----------|----------|-----------|
| **P1** | Ollama | Cuando se solicita generación de contenido |
| **P2** | Maxun | Jobs programados o bajo demanda (cuando Ollama libre) |
| **P3** | Supabase/Chatwoot | Siempre activos, bajo consumo |

---

## Comandos de Control

### PowerShell (Windows)

```powershell
# Ver estado de contenedores Maxun
docker ps --filter "name=maxun"

# Detener Maxun
D:\Repos\maxun; docker-compose stop

# Iniciar Maxun
D:\Repos\maxun; docker-compose up -d

# Ver uso de GPU (AMD)
# (Usar Task Manager → Rendimiento → GPU)

# Ver logs de Maxun
D:\Repos\maxun; docker-compose logs -f backend
```

### Ollama (via curl)

```bash
# Listar modelos
curl http://100.73.185.25:11434/api/tags

# Generar contenido
curl -s http://100.73.185.25:11434/api/generate -d '{
  "model": "qwen3:8b",
  "prompt": "Escribe una introducción sobre...",
  "stream": false
}' | jq -r '.response'
```

---

## Scripts Automáticos (Pendientes)

- [ ] `check-resources.ps1` — Verificar estado de servicios
- [ ] `ollama-session-start.ps1` — Detener Maxun, preparar Ollama
- [ ] `ollama-session-end.ps1` — Reanudar Maxun
- [ ] `maxun-job-start.ps1` — Verificar Ollama libre, iniciar Maxun

---

*Última actualización: 14/02/2026*
