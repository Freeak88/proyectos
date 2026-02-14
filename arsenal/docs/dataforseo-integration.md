# 🔍 DataForSEO Integration

> Documentación para usar DataForSEO API en proyectos de SEO.

---

## ¿Qué es DataForSEO?

API de datos SEO que permite:
- **SERP Tracking:** Resultados de búsqueda en tiempo real
- **Keywords Data:** Volúmenes de búsqueda, dificultad, sugerencias
- **Backlinks:** Análisis de perfil de enlaces
- **On-Page:** Análisis técnico de sitios

---

## Casos de Uso para Nuestros Proyectos

### 1. Análisis de Competencia (TourExperto, Embudo)
- Track diario de SERPs objetivo
- Identificar oportunidades de keywords
- Monitorear posiciones de competidores

### 2. Research de Keywords (Amplify Network)
- Volumen de búsqueda por país/idioma
- Keywords relacionadas y sugerencias
- Análisis de intención de búsqueda

### 3. Auditoría Técnica (Clinica Robles, FanaticApp)
- Análisis on-page automatizado
- Detección de issues técnicos
- Monitoreo de cambios

---

## Flujo de Trabajo Típico

```
1. POST /task_post
   ↓
2. Recibir task_id
   ↓
3. Esperar 1-5 minutos
   ↓
4. GET /task_get/{task_id}
   ↓
5. Procesar resultados
```

---

## Scripts Útiles

### Verificar créditos disponibles
```bash
curl --location 'https://api.dataforseo.com/v3/account' \
--header 'Authorization: Basic {CREDENTIALS}'
```

### Buscar volumen de keywords (Argentina)
```bash
curl --location 'https://api.dataforseo.com/v3/keywords_data/google/search_volume/task_post' \
--header 'Authorization: Basic {CREDENTIALS}' \
--header 'Content-Type: application/json' \
--data '[
  {
    "keywords": ["marketing digital", "seo argentina", "agencia marketing"],
    "location_code": 2826,
    "language_code": "es"
  }
]'
```

---

## Integración con Nuestro Stack

### Opción A: Scripts Node.js locales
- Ejecutar en whitemonkey
- Guardar resultados en Supabase local
- Procesar con Ollama para insights

### Opción B: Maxun + DataForSEO
- Usar Maxun para scraping complementario
- Enriquecer datos de DataForSEO con análisis de contenido

### Opción C: Pipeline automatizado
- Cron job en whitemonkey
- Daily SERP tracking
- Alertas de cambios de posición

---

## Recursos

- [Documentación oficial](https://docs.dataforseo.com/)
- [API Explorer](https://app.dataforseo.com/api-explorer)
- [Sandbox](https://sandbox.dataforseo.com/)

---

## Verificación de Estado

**Última prueba:** 14/02/2026 13:XX UTC

✅ **Autenticación:** Funcionando
✅ **Sandbox:** Accesible
✅ **Creación de tareas:** Operativa

### Ejemplo de llamada exitosa:
```bash
POST /v3/serp/google/organic/task_post
Response: 20000 (Ok)
Task ID: 02141610-9595-0066-2000-dadd438eb888
```

---

*Credenciales almacenadas en:* `.secrets/dataforseo.md`
