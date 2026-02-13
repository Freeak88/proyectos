# TourExperto — Estado Actual (Post-Migración)

## 🚨 Situación Crítica (Febrero 2026)

### Migración Nuxt 3
✅ **Completada** - El sitio está funcionando en producción  
⚠️ **Problemas técnicos urgentes** detectados post-migración que impactan SEO

---

## 🔴 Problemas Críticos (En Progreso)

### 1. CLS Desktop: 0.54 (¡Límite Google es 0.1!)
**Impacto**: Penalización directa en ranking de búsqueda  
**Causa**: Layout Reflow - contenido se empuja hacia abajo al cargar

**Fixes aplicados** (esperando medición):
- ✅ Product Hero: `aspect-ratio: 800/500` (mobile), `1200/450` (desktop)
- ✅ Carousel Recorre: `min-height: 11rem` (mobile), `14rem` (desktop)
- ✅ CarouselStatic: cambiado de `min-height: 1px` a `auto`
- ✅ Sidebar Details: `min-h-[16rem]` en tarjeta "Reserva tu viaje"
- ✅ Product Itinerario: `width="288" height="176"` en NuxtImg
- ✅ Home: `#fallback` con `min-height: 200vh` en ClientOnly

### 2. Hydration Mismatches
**Páginas afectadas**: Landing de Producto (Tour), Home  
**Causas identificadas**:
- Fechas: `moment` vs native
- Precios: formatos de moneda difieren entre server/cliente
- `toLocaleString()` sin locale (usar `formatPrice()` del util)
- Dependencias de `localStorage` y `window.innerWidth`

**Fix aplicado**:
- ✅ Product Top: SSR renderiza como desktop (`isMobile=false`), ajusta post-mount en mobile
- ✅ Search Filtros: reemplazado `toLocaleString()` por `formatPrice()`

### 3. API Newton: Timeouts y Latencia
**Impacto**: Frena carga del sitio, errores 500 esporádicos  
**Estado**: Pendiente implementar capa de caché

### 4. SSR Falla en Productos (Perú e Italia)
**Síntoma**: Errores 500 "unhandled" en servidor  
**Impacto**: Google encuentra error 500 en lugar de contenido  
**Solución propuesta**: Manejo elegante - que la página cargue con contenido parcial si un dato falla

### 5. Redirecciones Problemáticas
**Problema**: Muchas 301 apuntan a URLs con errores o timeouts (Soft 404s)  
**Impacto**: Pérdida de autoridad de dominio  
**Propuesta**: Mover redirecciones al Edge (Load Balancer/CloudFront) - **en consulta con Server**

### 6. Payload NUXT_DATA Sobrecargado
**Problema**: Se envían datos que el front no necesita  
**Solución**: Aplicar `pick` en `useFetch` de páginas de productos  
**Impacto esperado**: Mejorar TTI (Time to Interactive) en móviles

### 7. Observabilidad (onError)
**Estado**: Pendiente implementación  
**Consulta**: En curso con equipo de Server  
**Objetivo**: Capturar origen exacto de fallos 500, evitar que Google vea errores

---

## ✅ Progreso Reciente

### Logros Técnicos
- ✅ Migración Nuxt 3 completada
- ✅ Fixes de CLS aplicados (esperando medición)
- ✅ Problema de traducciones de hoteles identificado y corregido
- ✅ Hook onError en progreso (implementación de logs activa)

### Hallazgos Importantes
- Problema crítico encontrado: traducciones de nombres de hoteles rompían tours
- Logs de onError ya funcionando - permitieron identificar problemas reales

---

## 📋 Próximos Pasos Prioritarios

1. **Medir CLS** tras fixes aplicados (esperar rastreo Search Console)
2. **Implementar caché** para API Newton
3. **Validar destinos** de redirecciones 301 (evitar Soft 404s)
4. **Optimizar payload** con pick en useFetch
5. **Completar hook onError** con envío por mail

---

## 👥 Equipo de Contacto

**Coordinación IT**: Gabriela Faingold  
📧 gabriela@tourexperto.com  
📱 +1 (754) 267-3454

**SEO/Strategy**: Damián Ferraro

---

*Última actualización: 2025-02-13*  
*Estado: Post-migración - Optimización en curso*
