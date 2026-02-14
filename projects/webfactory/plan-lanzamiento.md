# 🚀 Plan de Lanzamiento — Web Factory

> *"Democratizar la presencia digital para pequeños negocios"*
> 
> **Versión:** 1.0 | **Fecha:** Febrero 2026 | **Equipo:** Damián + Lean

---

## 🎯 Resumen Ejecutivo

**Web Factory** es una propuesta de valor única: sitios web profesionales para pequeños comercios a precios accesibles, usando IA y automatización para reducir costos operativos en 90%.

**MVP del Lanzamiento:** Landing page + sistema de cotización automática + 3 casos de estudio.

---

## 📊 FASES DEL LANZAMIENTO

### FASE 0: Pre-Launch (Semanas -4 a 0)

#### Semana -4: Fundamentos Técnicos
| Tarea | Responsable | Entregable |
|-------|-------------|------------|
| Definir stack técnico | Lean | Decisiones documentadas |
| Setup repo y CI/CD | Lean | GitHub Actions funcionando |
| Configurar Supabase | Lean | DB schema inicial |
| Diseño de marca básico | Damián | Logo, colores, tipografía |

#### Semana -3: Desarrollo MVP
| Tarea | Responsable | Entregable |
|-------|-------------|------------|
| Landing page principal | Lean | Next.js deployado en Vercel |
| Sistema de cotización | Lean | Formulario + lógica de precios |
| Copy inicial | Damián | Textos de landing + SEO básico |
| Casos de estudio (3) | Damián | Contenido de 3 negocios ficticios |

#### Semana -2: Contenido y SEO
| Tarea | Responsable | Entregable |
|-------|-------------|------------|
| Cluster SEO inicial | Damián | 5 artículos satélite |
| Setup Google Analytics | Lean | Tracking funcionando |
| Search Console | Damián | Indexación solicitada |
| Pruebas de usuario | Ambos | 3 tests con comerciantes |

#### Semana -1: Soft Launch
| Tarea | Responsable | Entregable |
|-------|-------------|------------|
| Beta cerrada (5 clientes) | Damián | Feedback recopilado |
| Ajustes finales | Lean | Bugs corregidos |
| Material de ventas | Damián | PDF de servicios + FAQ |
| Automatización emails | Lean | Workflows de onboarding |

#### Semana 0: Launch Day 🚀
- Publicar en redes personales
- Enviar a lista de contactos
- Publicar primer post en LinkedIn
- Activar anuncios (si hay presupuesto)

---

## 💰 ESTRATEGIA DE PRECIOS

### Modelo de Precios: "Accesibilidad Radical"

| Servicio | Precio | ¿Qué incluye? | Margen estimado |
|----------|--------|---------------|-----------------|
| **Landing Express** | €99 | 1 página, 3 secciones, formulario, mobile | 70% |
| **Web Profesional** | €199 | 5 páginas, SEO básico, blog, analytics | 75% |
| **Tienda Online** | €399 | E-commerce, pagos, inventario, shipping | 60% |
| **Mantenimiento** | €19/mes | Hosting, backups, updates, soporte | 85% |

### Estructura de Costos (por proyecto)

| Concepto | Costo | Notas |
|----------|-------|-------|
| Hosting Vercel | €0 | Free tier suficiente inicial |
| Supabase | €0 | Free tier (500MB) |
| Dominio cliente | €10/año | Passthrough al cliente |
| IA (OpenAI) | €2-5 | Generación de contenido |
| Tiempo Lean | €20/h × 3h = €60 | Desarrollo automatizado |
| Tiempo Damián | €15/h × 2h = €30 | Copy + QA |
| **Costo total** | **~€97** | Para Web Profesional (€199) |
| **Margen** | **~51%** | Mejora con escala |

### Comparativa Competencia

| Competidor | Precio base | Diferenciación Web Factory |
|------------|-------------|---------------------------|
| Agencia tradicional | €2,000+ | 90% más barato |
| Wix/Squarespace DIY | €15-30/mes | Nosotros hacemos TODO |
| Freelancer low-cost | €300-500 | Calidad consistente + soporte |
| Web Factory | €99-399 | Precio justo + IA + humanos |

---

## 📢 CANALES DE ADQUISICIÓN

### 1. Orgánico (Prioridad Alta)

#### SEO (Cluster de Contenido)
**Pilar:** "Cómo crear una web para mi negocio"

**Satélites TOFU:**
- "¿Cuánto cuesta una página web en 2026?"
- "Mejores plataformas para crear web de negocio"
- "Cómo vender online sin saber de tecnología"

**Satélites MOFU:**
- "Comparativa: web vs redes sociales para negocios"
- "Cuánto debería gastar en web mi tienda"
- "Errores comunes al hacer una web de negocio"

**Satélites BOFU:**
- "Web Factory vs Wix: cuál elegir"
- "Caso de éxito: cómo aumenté ventas 30% con web"
- "Guía: primeros pasos con Web Factory"

#### LinkedIn Orgánico
- 3 posts semanales sobre transformación digital
- Historias de clientes (cuando los haya)
- Tips prácticos para comerciantes
- Engagement con comunidad de emprendedores

### 2. Referidos (Prioridad Alta)

**Programa: "Comercio Ayuda Comercio"**
- Cliente refiere a otro: 20% descuento en próximo mes
- Afiliados: 15% comisión por venta
- Partner con asociaciones de comerciantes locales

### 3. Paid Ads (Fase 2)

**Google Ads** (cuando haya budget)
- Keywords: "crear web para negocio", "web barata tienda", "diseño web pyme"
- Budget inicial: €100/mes
- Target: 50km radius de ubicación inicial

**Meta Ads** (Facebook/Instagram)
- Target: propietarios de pequeños negocios, 35-55 años
- Creatives: video testimonials, antes/después
- Budget inicial: €150/mes

### 4. Alianzas Estratégicas

| Partner | Tipo de acuerdo | Beneficio |
|---------|-----------------|-----------|
| Cámaras de comercio | Referidos | Acceso a base de pymes |
| Consultores de marca | Revenue share | Clientes que necesitan web |
| Proveedores de POS | Integración | Web + sistema de ventas |
| Asociaciones de barrio | Patrocinio | Confianza local |

---

## 🛠️ STACK TÉCNICO MÍNIMO VIABLE

### Frontend
```
Next.js 15 (App Router)
├── Tailwind CSS (estilos)
├── shadcn/ui (componentes)
├── Framer Motion (animaciones)
└── Vercel (hosting)
```

### Backend
```
Supabase
├── PostgreSQL (datos)
├── Auth (login clientes)
├── Storage (imágenes)
└── Edge Functions (APIs)
```

### Automatización
```
Make.com / n8n
├── Formulario → Notificación Slack
├── Nuevo cliente → Email onboarding
├── Recordatorio pagos
└── Reportes semanales
```

### IA
```
OpenAI API
├── Generación de copy
├── Optimización SEO
└── Chatbot soporte básico
```

### Analytics
```
Google Analytics 4
Search Console
Hotjar (heatmaps)
```

---

## 📈 MÉTRICAS DE ÉXITO

### KPIs Semanales (Mes 1-3)

| Métrica | Meta Semana 4 | Meta Mes 3 |
|---------|---------------|------------|
| Visitas landing | 500 | 3,000 |
| Leads (formulario) | 10 | 50 |
| Cotizaciones enviadas | 5 | 30 |
| Ventas cerradas | 2 | 15 |
| Tasa conversión | 20% | 30% |
| CAC (costo adquisición) | €25 | €15 |

### KPIs Mensuales (Mes 4-12)

| Métrica | Meta Mes 6 | Meta Año 1 |
|---------|------------|------------|
| MRR (monthly recurring) | €1,000 | €5,000 |
| Clientes activos | 20 | 100 |
| Churn rate | <5% | <3% |
| NPS (satisfacción) | >50 | >70 |
| Referidos | 20% | 40% |
| Tiempo promedio entrega | 5 días | 3 días |

### Métricas de Salud del Negocio

| Indicador | Fórmula | Meta |
|-----------|---------|------|
| LTV/CAC ratio | LTV ÷ CAC | >3x |
| Payback period | Inversión ÷ MRR nuevo | <6 meses |
| Margen bruto | (Ingresos - Costos) ÷ Ingresos | >50% |
| Utilización capacidad | Proyectos ÷ Capacidad máx | 70-85% |

---

## 🗓️ TIMELINE DETALLADO

### Mes 1: Fundamentos (Feb 2026)
```
Semana 1:
├── Setup técnico (Lean)
├── Diseño de marca (Damián)
└── Definición de procesos

Semana 2:
├── Landing page MVP
├── Sistema de cotización
└── Copy inicial

Semana 3:
├── Casos de estudio (ficticios)
├── Material de ventas
└── Testing interno

Semana 4:
├── Beta con 5 clientes (gratis)
├── Feedback y ajustes
└── Preparación launch
```

### Mes 2: Lanzamiento (Mar 2026)
```
Semana 1: Launch Day 🚀
├── Publicación en redes
├── Email a contactos
├── Primeros posts LinkedIn
└── Activar tracking

Semana 2-4:
├── Captar primeros 10 clientes
├── Documentar casos de éxito reales
├── Ajustar precios si es necesario
└── Optimizar landing según datos
```

### Mes 3-6: Crecimiento (Abr-Jul 2026)
```
├── Lanzar programas de referidos
├── Crear contenido SEO (2 artículos/semana)
├── Primeros anuncios pagados (€100/mes)
├── Alcanzar 20-30 clientes
├── Implementar automatizaciones avanzadas
└── Evaluar pivot o scale
```

### Mes 7-12: Escala (Ago 2026 - Ene 2027)
```
├── Contratar primer empleado (soporte)
├── Lanzar upsells (SEO avanzado, marketing)
├── Expandir a nichos específicos (restaurantes, tiendas)
├── Alianzas con cámaras de comercio
├── Meta: 100 clientes activos
└── Evaluar expansión geográfica
```

---

## 🎲 ESCENARIOS

### Escenario Optimista (20% probabilidad)
- Landing convirte 40%+
- Viralidad orgánica en redes
- 50 clientes en mes 3
- MRR €3,000 en mes 6

**Respuesta:** Scale rápido, contratar, aumentar precios gradualmente.

### Escenario Base (60% probabilidad)
- Conversión landing 25-30%
- Crecimiento orgánico lento pero constante
- 20 clientes en mes 3
- MRR €1,000 en mes 6

**Respuesta:** Continuar plan original, optimizar procesos.

### Escenario Pesimista (20% probabilidad)
- Conversión <15%
- Dificultad para captar clientes
- <10 clientes en mes 3

**Respuesta:** 
- Pivotar nicho (ej: enfocar solo en restaurantes)
- Reducir precios temporalmente
- Buscar partnerships agresivamente
- Reevaluar propuesta de valor

---

## 🚨 RIESGOS Y MITIGACIÓN

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|-------------|---------|------------|
| Competencia baja precios | Alta | Medio | Diferenciación por servicio humano |
| Calidad inconsistente | Media | Alto | Templates robustos + checklists QA |
| Saturación de mercado | Baja | Alto | Nichos específicos + geográfico |
| Dependencia de Lean | Alta | Alto | Documentación + automatización extrema |
| Clientes exigentes | Media | Medio | Expectativas claras + contrato simple |
| Falta de tracción inicial | Media | Alto | Programa de referidos agresivo |

---

## 📋 CHECKLIST PRE-LAUNCH

### Técnicas
- [ ] Dominio comprado y configurado
- [ ] SSL certificate activo
- [ ] Landing page responsive (test en móvil)
- [ ] Formularios funcionando
- [ ] Analytics instalado
- [ ] Search Console configurado
- [ ] Backups automáticos
- [ ] Política de privacidad / GDPR

### De Negocio
- [ ] Cuenta bancaria / Stripe
- [ ] Contrato de servicio template
- [ ] Facturación automatizada
- [ ] FAQ completa
- [ ] Email de onboarding
- [ ] Proceso de soporte definido

### Marketing
- [ ] LinkedIn perfil optimizado
- [ ] 5 posts LinkedIn escritos
- [ ] 3 artículos SEO publicados
- [ ] Material de ventas (PDF)
- [ ] Casos de estudio (3 mínimo)
- [ ] Email a lista de contactos preparado

---

## 🎯 PRÓXIMOS PASOS INMEDIATOS

### Esta semana:
1. **Lean:** Setup técnico básico (repo, Vercel, Supabase)
2. **Damián:** Brief de diseño de marca
3. **Ambos:** Definir detalles de precios y paquetes

### Próximas 2 semanas:
1. Landing page funcional
2. 3 casos de estudio completos
3. Sistema de cotización operativo

### Mes 1 objetivo:
> **5 clientes beta gratis** → feedback → ajustes → **launch público**

---

*Plan vivo — Revisar semanalmente en primeros 3 meses*
