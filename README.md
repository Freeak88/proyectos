# Proyectos Compartidos

Repositorio colaborativo entre **Damián**, **Lean** y sus agentes de IA (Aletheia, etc.).

## 📁 Estructura

```
proyectos/
├── README.md                    # Este archivo
├── amplify-network/
│   ├── summary.md              # Visión y objetivos
│   └── market-research.md      # Investigación de mercado
├── tourexperto/
│   └── summary.md              # Estrategia TourExperto
├── lexicon/
│   └── summary.md              # Automatización marketing
└── spiedo-longchamps/
    └── summary.md              # Vigilancia operativa
```

## 👥 Identificación de Commits

| Quién | Identificador | Ejemplo |
|-------|--------------|---------|
| Damián | `user.name="Damián"` | `feat: nuevo análisis` |
| Lean | `user.name="Lean"` | `fix: corrección de typo` |
| Aletheia (Bot) | `user.name="Aletheia [Bot]"` | `docs: indexación automática` |

## 🔄 Flujo de Trabajo

1. **Antes de editar**: `git pull origin main`
2. **Editar archivos**: Seguir convenciones de cada proyecto
3. **Commitear**: Usar prefijos claros (`feat:`, `fix:`, `docs:`, `sync:`)
4. **Pushear**: `git push origin main`

## 📝 Convención de Commits

```
[tipo]: [descripción] - [autor/contexto]

tipos:
- feat:     Nueva funcionalidad
- fix:      Corrección de errores
- docs:     Documentación
- sync:     Sincronización automática
- refactor: Cambio de estructura sin cambiar funcionalidad
```
