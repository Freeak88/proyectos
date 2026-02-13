# Amplify Network — Objetivos y Estrategia

## Visión de Largo Plazo
Protocolo de Liquidación y Contabilidad para la economía de creadores. Reemplazar el modelo ineficiente de "Tarifa Plana" por un sistema de Pago por Performance (P4P-V).

## La Tesis del Mercado Roto
El mercado actual de $250B es ineficiente porque:
1. **Marcas**: 53% no puede medir ROI real. Pagan por proxies (seguidores) asumiendo todo el riesgo.
2. **Creadores**: Sufren "Atomización de Precios". No cobran por el valor real de su red.
3. **Clippers**: Fuerza motriz de la viralidad, operan en ilegalidad sin remuneración.

## Pilares del Protocolo

### 1. Aversión a la Pérdida (Disparador B2B)
- Modelo heredado: "Págame y reza"
- Modelo Amplify: "Paga solo por vistas reales auditadas"
- **Pozo de Performance**: Fondos en escrow que solo se liquidan con resultados medibles

### 2. Manifiesto de Red (Nuevo Activo)
Métricas financieras que reemplazan "número de seguidores":
- **ARV** (Alcance de Red Verificado): Alcance del Creador + red de clippers
- **RNPE** (Performance Real de Red): Vistas reales rastreadas que ejecutan pagos

### 3. Meritocracia Gamificada
- Acceso a campañas se gana por **scoring**, no por fama
- Micro-UGCs: Suben de nivel por calidad y cumplimiento
- Clippers: Ganan legalmente por habilidad de viralizar, manteniendo anonimato

## Arquitectura del Sistema (MVP)

### Motor Central (Backend)
| Componente | Función |
|------------|---------|
| Motor de Atribución (RNPE) | Genera links únicos, rastrea vistas en TikTok/Reels/Shorts |
| Motor de Liquidación (P4P-V) | Retiene pozo de marca, ejecuta micro-pagos cada 1,000 vistas |
| Algoritmo de Scoring | Evalúa calidad de contenido y velocidad de entrega |

### 4 Portales (Frontend)
| Portal | Actor | Dolor Resuelto |
|--------|-------|----------------|
| Marca | Cliente | Riesgo de ROI y reputación |
| Creador | Talento | Estafas y pagos injustos |
| Clipper | Motor viral | Ilegalidad y trabajo gratis |
| Admin | Amplify | Inefficiencia del mercado |

## KPIs Principales
- [ ] Validar modelo P4P-V con 10 marcas piloto
- [ ] Onboard 100 creadores al sistema de scoring
- [ ] Procesar $10K en transacciones de prueba
- [ ] Alcanzar ARV combinado de 10M de alcance

## Stack Técnico
- Backend: Node.js / Python
- Blockchain: Smart contracts para escrow (evaluar)
- Tracking: Atribución cross-platform (TikTok, Reels, Shorts)
- Frontend: React (portales de marca y creador)

## Flujo de Valor (The Loop)

1. **Financiación**: La Marca deposita $10k en el "Pozo de Performance" (Riesgo 0)
2. **Producción**: El Micro-UGC crea el video base → La Marca valida y aprueba → El Creador recibe pago base garantizado
3. **Distribución (La Armería)**: El video aprobado entra a la Librería → Cientos de Clippers descargan, editan bangers y generan sus links RNPE únicos
4. **Viralización**: Los clips inundan las redes (TikTok, Reels)
5. **Liquidación**: El Motor RNPE detecta vistas → El Motor P4P-V saca dinero del Pozo y paga al Clipper (por vista) y al Creador (bonus) instantáneamente
6. **Retorno**: La Marca ve cómo su dinero se convirtió en vistas reales → Amplify cobra su fee sobre el flujo

## Contexto de Mercado 2025

El lanzamiento de Amplify es crítico ahora debido a la saturación de canales tradicionales:

- **Inflación de Costos**: CPMs de Snapchat subieron 47% y costos Q4 en Meta aumentan drásticamente
- **Eficiencia de TikTok**: CPM más bajo ($3.21 vs $8.19 de Meta) pero requiere volumen masivo y creatividad nativa
- **La Oportunidad**: Marcas necesitan "Jump Starts" de viralidad antes de fechas clave (Black Friday) para evitar costos prohibitivos de publicidad paga

## Modelo de Negocio

**No somos un SaaS. Somos una Fintech de Medios.**

- **Ingreso**: Tarifa de Transacción (5-15%) sobre volumen total del "Pozo de Performance" liquidado
- **Moat (Defensibilidad)**: Propiedad de la red de clippers legalmente activada + algoritmo de scoring histórico

## Hallazgos de Investigación de Mercado

### Tamaño del Mercado
- **TAM**: $250B+ (creator economy)
- **Influencer Marketing**: $32.55B (2025), crecimiento 21% YoY
- **SOM**: $500M-$1B (P4P influencer marketing)

### Contexto Competitivo
- **53%** de las marcas no puede medir ROI real
- Ningún competidor ofrece P4P puro con red de clippers integrada
- CPMs creciendo: Snapchat +47%, Meta estable pero saturado
- TikTok CPM $3.21 vs Meta $8.19 (61% más barato)

### Oportunidad Temporal
- Potencial ban de TikTok en US genera incertidumbre (-17.2% intención de inversión)
- Marcas buscan alternativas a tarifa plana
- Q4 2025 (Black Friday) es momento crítico para "jump starts" de viralidad

### Recursos
- **Investigación completa**: `market-research.md` (15K+ palabras)
- **Documentación técnica**: Ver sección IX (Roadmap)
- **Análisis de competidores**: Sección II del research

## Notas Operativas
- Prioridad: MVP del Motor de Atribución (RNPE)
- Desafío técnico: Tracking preciso de vistas cross-platform
- Oportunidad: Integración con DataForSEO para métricas de red
- Timing crítico: Q4 2025 (Black Friday) es fecha objetivo para marcas piloto

*Última actualización: 2025-01-21*
