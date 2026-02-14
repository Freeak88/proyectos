# 🧠 Ollama Local + Lexicon — Guía Operativa

> Lecciones aprendidas y mejores prácticas para usar Ollama (Qwen3:8b) como motor de generación de contenido Lexicon.
> **Fecha de documentación:** 14/02/2026
> **Basado en:** Prueba real con artículo "WiFi Marketing para embudo.com.ar"

---

## ⚠️ Hallazgo Crítico

**Qwen3:8b (local via Ollama) NO puede generar artículos completos de 1,200+ palabras en un solo prompt.**

El modelo se "ahoga" (timeout, procesos colgados, output incompleto) cuando se le pide contenido extenso en una sola llamada.

---

## ✅ Solución Validada: Chunked Generation

**Principio:** Dividir el artículo en chunks de ~300-400 palabras y generar cada uno por separado.

### Estructura de chunks para artículo tipo:

| Chunk # | Contenido | Palabras estimadas |
|---------|-----------|-------------------|
| 1 | Snippet Zero + Introducción | ~200 |
| 2 | Secciones 1-2 (ej: Restaurantes + Hoteles) | ~300 |
| 3 | Secciones 3-4 (ej: Retail + Estética) | ~300 |
| 4 | Conclusión + CTA + Links | ~150 |
| **TOTAL** | | **~950-1,200** |

---

## 🔄 Flujo de Trabajo Optimizado

### Para Pilar Pages (~1,800-2,500 palabras):

```
Chunk 1: Snippet Zero + Intro (~200 palabras)
Chunk 2: ¿Cómo funciona? (~300 palabras)
Chunk 3: Beneficios (~400 palabras)
Chunk 4: Casos por industria (~400 palabras)
Chunk 5: Comparativa/Tabla (~300 palabras)
Chunk 6: Implementación (~300 palabras)
Chunk 7: FAQ (~200 palabras)
Chunk 8: Conclusión (~150 palabras)
```

**Tiempo total:** ~10-12 minutos (vs timeout con generación única)

### Para Satélites (~1,000-1,500 palabras):

```
Chunk 1: Snippet Zero + Intro (~200 palabras)
Chunk 2: Contenido principal A (~300 palabras)
Chunk 3: Contenido principal B (~300 palabras)
Chunk 4: Conclusión + CTA + Link al pilar (~150 palabras)
```

**Tiempo total:** ~5-6 minutos

---

## 📝 Prompt Template para Chunks

### Chunk 1 (Introducción):
```
Escribí la INTRODUCCIÓN de un artículo SEO sobre "[TEMA]" (~200 palabras).

REQUISITOS:
1. Snippet Zero Answer Box: definición breve de [CONCEPTO]
2. Contexto: por qué es importante
3. Mencionar que el artículo cubrirá [X, Y, Z]
4. Transición a la primera sección
5. Link al pilar con anchor "[KEYWORD PRINCIPAL]"
6. Tono: [profesional/accesible/técnico]

Respondé SOLO el HTML.
```

### Chunks 2-N (Contenido):
```
Escribí dos secciones de un artículo sobre [TEMA] (~300 palabras total).

SECCIÓN 1 - [SUBTEMA A]:
- Problema: [descripción]
- Solución: [solución WiFimarketing]
- Resultado: [métrica estimada]

SECCIÓN 2 - [SUBTEMA B]:
- Problema: [descripción]
- Solución: [solución]
- Resultado: [métrica estimada]

REQUISITOS:
- Usar <h3> para cada sección
- Tono práctico con datos estimados
- Entidades: [lista de entidades LSI]

Respondé SOLO el HTML.
```

### Chunk Final (Conclusión):
```
Escribí la CONCLUSIÓN de un artículo "[TÍTULO]" (~150 palabras).

REQUISITOS:
1. Resumir brevemente los puntos clave
2. Mensaje motivador sobre [TEMA]
3. CTA: invitar a leer [PRÓXIMO CONTENIDO]
4. Link al pilar con anchor "[KEYWORD]"
5. Tono motivador pero profesional

Respondé SOLO el HTML.
```

---

## 🎯 Ajustes a Skills de Lexicon

### Modificaciones necesarias a los prompts originales:

| Skill | Ajuste requerido |
|-------|------------------|
| `lexicon-article-writer` | Cambiar "Escribí un artículo de X palabras" → "Escribí la INTRODUCCIÓN...", "Escribí la sección..." |
| `lexicon-ghostwriter` | Aplicar adversarial editing POR CHUNK, no al artículo completo |
| `lexicon-psycho-llm` | Generar Shadow Twin y Abstract del artículo COMPLETO ya ensamblado |

---

## 📊 Métricas Reales (Qwen3:8b en RX 6700 XT)

| Tipo de generación | Tiempo por chunk | Éxito |
|-------------------|------------------|-------|
| Chunk 300 palabras | 30-45 segundos | ✅ 100% |
| Chunk 400 palabras | 45-60 segundos | ✅ 100% |
| Artículo 1,200 palabras (único) | 3-5 minutos | ❌ 30% (timeouts) |
| Artículo 2,000 palabras (único) | 5-8 minutos | ❌ 0% (siempre falla) |

**Conclusión:** Chunks de 300-400 palabras = sweet spot.

---

## 💰 Costos

| Componente | Costo por artículo |
|------------|-------------------|
| DataForSEO (research) | $0.05-0.10 |
| Ollama (generación chunks) | $0.00 |
| **Total** | **~$0.05-0.10** |

**Comparación:** GPT-4o-mini para artículo completo = ~$0.30-0.50

**Ahorro:** 70-80%

---

## 🛠️ Scripts Útiles

### Ensamblar chunks automáticamente:
```bash
#!/bin/bash
# assemble-article.sh

cat chunk-1-intro.html \
    chunk-2-seccion.html \
    chunk-3-seccion.html \
    chunk-4-conclusion.html > articulo-completo.html

echo "Artículo ensamblado: $(wc -w < articulo-completo.html) palabras"
```

---

## ⚡ Troubleshooting

### Problema: Chunk tarda más de 90 segundos
**Solución:** Reducir a 250 palabras o simplificar prompt.

### Problema: Output cortado/incompleto
**Solución:** El chunk es muy largo. Dividir en 2 chunks más pequeños.

### Problema: Repetición entre chunks
**Solución:** Asegurar que cada chunk tenga transición clara y no solape contenido.

---

## 📚 Flujo Completo Documentado

### Para nuevo artículo:

1. **Research** (DataForSEO API)
   - Keywords, volumen, competencia
   - Top 3 URLs para análisis

2. **Strategy** (Ollama - 1 prompt)
   - Definir pilar vs satélites
   - Asignar TOFU/MOFU/BOFU
   - Validar semanticamente

3. **Writing** (Ollama - N chunks)
   - Chunk 1: Intro + Snippet Zero
   - Chunks 2-N: Contenido por secciones
   - Chunk Final: Conclusión + CTA

4. **Ensamblaje** (script/manual)
   - Concatenar chunks
   - Verificar coherencia
   - Contar palabras totales

5. **Ghostwriter** (Ollama - por chunk o completo)
   - Aplicar burstiness
   - Aplicar perplexity
   - Eliminar frases prohibidas

6. **Psycho-LLM** (Ollama - 1 prompt)
   - Generar Abstract (Shadow Twin)
   - Agregar citas [1], [2]
   - LaTeX para números

7. **Publicación**
   - Artículo humano (Ghostwriter)
   - /llms.txt (Shadow Twin)
   - Interlinking a satélites/pilar

---

## 🔗 Referencias

- **Qwen3:8b** ejecutándose en: `whitemonkey` (100.73.185.25:11434)
- **GPU:** RX 6700 XT (12GB VRAM)
- **Skill Lexicon:** `lexicon-article-writer`, `lexicon-ghostwriter`, `lexicon-psycho-llm`
- **Prueba de concepto:** `/projects/lexicon/wifi-marketing-*/`

---

*Documentación creada tras prueba real. Actualizar si se cambia de modelo (ej: gemma3:12b) o si se ajustan los límites de chunks.*
