# 📚 Lexicon Skills Suite — Índice Maestro

> Sistema completo de generación de contenido SEO (Lexicon v3.0+) integrado a OpenClaw.
> Recibido de Antigravity el 14/02/2026.

---

## 🧬 Estructura del Sistema

```
Lexicon Ecosystem
├── 1. FUNDACIÓN
│   └── lexicon-architecture/       ← ADN del proyecto (clusters, topical authority)
│
├── 2. INTELIGENCIA
│   ├── lexicon-researcher/         ← Data mining (DataForSEO, PAAs, gaps)
│   └── lexicon-cluster-architect/  ← Estrategia (v3.0 vs v4.0 improvements)
│
├── 3. PRODUCCIÓN
│   ├── lexicon-article-writer/     ← Estructura + Snippet Zero protocol
│   └── lexicon-ghostwriter/        ← Humanización (Burstiness, Perplexity)
│
├── 4. OPTIMIZACIÓN
│   ├── lexicon-psycho-llm/         ← Citabilidad RAG (LCS Score)
│   └── llms-txt-protocol/          ← Interfaz IA (/llms.txt)
```

---

## 🔄 Workflow Recomendado

```
Research → Cluster Strategy → Content Engineering → Humanization → AI Citability Pass

1. lexicon-researcher/       [Investigar keywords, PAAs, competencia]
      ↓
2. lexicon-cluster-architect/ [Definir estrategia de clusters]
      ↓
3. lexicon-article-writer/    [Generar estructura + contenido base]
      ↓
4. lexicon-ghostwriter/       [Humanizar (adversarial editing)]
      ↓
5. lexicon-psycho-llm/        [Optimizar para RAG/GEO]
      ↓
6. llms-txt-protocol/         [Crear /llms.txt si aplica]
```

---

## 🎯 Casos de Uso con Ollama (Costo Cero)

### Caso A: Artículo SEO Completo
```
1. Research (DataForSEO real) → Yo hago las llamadas API
2. Strategy (Ollama qwen3:8b) → Leo lexicon-cluster-architect/
3. Draft (Ollama qwen3:8b)    → Leo lexicon-article-writer/
4. Humanize (Ollama qwen3:8b) → Leo lexicon-ghostwriter/
5. Audit (Manual/yo)          → Verifico con lexicon-psycho-llm/
```

### Caso B: Cluster de Contenidos
```
1. Investigar nicho → DataForSEO API
2. Definir pillar + satellites → Ollama + lexicon-architecture/
3. Generar outlines → Ollama + lexicon-article-writer/
4. Batch writing → Ollama chunks
```

### Caso C: Optimización GEO (Generative Engine Optimization)
```
1. Analizar contenido existente
2. Aplicar LCS Score → lexicon-psycho-llm/
3. Generar Shadow Twin version
4. Crear /llms.txt → llms-txt-protocol/
```

---

## ⚡ Ventajas del Flujo con Ollama

| Aspecto | Costo | Calidad | Velocidad |
|---------|-------|---------|-----------|
| Research (DataForSEO) | Pago por uso (créditos) | Alta | Instantáneo |
| Strategy (Ollama) | $0 | Media-Alta | 2-3 min |
| Writing (Ollama) | $0 | Media (requiere revisión) | 3-5 min/artículo |
| Humanization (Ollama) | $0 | Media | 1-2 min |
| **Total por artículo** | **~$0.01-0.05** (solo DataForSEO) | **Alta** | **~10 min** |

---

## 🔧 Herramientas Disponibles

- ✅ DataForSEO API (integrado, probado)
- ✅ Ollama en whitemonkey (qwen3:8b, gemma3:12b)
- ✅ Maxun para scraping complementario
- ✅ Supabase local para almacenar datos

---

## 📋 Próximas Implementaciones

- [ ] Script automatizado: Research → Strategy → Outline
- [ ] Batch processor para múltiples artículos
- [ ] Integración con Maxun para scraping de competencia
- [ ] Dashboard de tracking de keywords (DataForSEO + Supabase)

---

## 📋 Documentación Operativa

- [Flujo Ollama + Lexicon](../../arsenal/docs/ollama-lexicon-workflow.md) — Guía de uso de Qwen local con chunks
- [DataForSEO Integration](../../arsenal/docs/dataforseo-integration.md) — API de research

---

*Lexicon Suite v3.0+ | Integrado a OpenClaw | 14/02/2026*
