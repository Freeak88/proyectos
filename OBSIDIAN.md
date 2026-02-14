# 🧠 Proyectos — Vault de Obsidian

Este repo funciona como **vault compartido de Obsidian** para el equipo.

---

## 📁 Estructura

```
proyectos/
├── .obsidian/           ← Configuración del vault (no tocar)
├── README.md            ← Este archivo
│
├── amplify-network/     ← Proyecto
│   ├── summary.md       ← Documento maestro
│   └── notes/           ← Notas de Obsidian
│
├── tourexperto/
│   ├── summary.md
│   └── notes/
│
├── lexicon/
│   ├── summary.md
│   └── notes/
│
└── thethink.dev/
    ├── clinica-robles/
    ├── fanaticapp/
    └── notes/
```

---

## ⚡ Setup Inicial

### 1. Clonar el repo

```bash
git clone https://github.com/Freeak88/proyectos.git
cd proyectos
```

### 2. Abrir en Obsidian

1. Abrir Obsidian
2. "Open folder as vault"
3. Seleccionar la carpeta `proyectos/`

Listo. Cada proyecto tiene su carpeta `notes/` para notas libres.

---

## 🔄 Flujo de Trabajo

### Antes de empezar a trabajar

```bash
git pull
```

### Cuando terminás de escribir

```bash
git add .
git commit -m "docs: notas sobre [tema]"
git push
```

**Prefijos de commit recomendados:**
| Prefijo | Uso |
|---------|-----|
| `docs:` | Notas, documentación |
| `feat:` | Nueva funcionalidad documentada |
| `fix:` | Correcciones |
| `sync:` | Sincronización automática |

---

## 🏷️ Convenciones de Notas

### Nombres de archivo
- Usar kebab-case: `idea-nueva-funcionalidad.md`
- Fechas opcionales: `2025-02-14-reunion-cliente.md`

### Links entre notas
- Obsidian está configurado para usar links relativos
- Escribí `[[nombre-nota]]` para linkear

### Etiquetas útiles
```markdown
#proyecto/amplify #estado/idea #prioridad/alta
```

---

## 👥 Identidad de Commits

Configurá tu nombre para que quede claro quién escribió qué:

```bash
# Damián
git config user.name "Damián"
git config user.email "tu@email.com"

# Lean
git config user.name "Lean"
git config user.email "lean@email.com"

# Aletheia (bot)
git config user.name "Aletheia [Bot]"
git config user.email "aletheia@openclaw.local"
```

---

## 🔒 Qué NO commitear

- `.obsidian/workspace.json` (configuración local de ventanas)
- `.obsidian/plugins/` (plugins instalados localmente)
- Archivos `.DS_Store` (macOS)

Ya están en `.gitignore`.

---

## 🆘 Resolución de Conflictos

Si hiciste pull y hay conflictos:

```bash
# Ver qué archivos están en conflicto
git status

# Editar los archivos marcados, buscar <<<<<<< ======= >>>>>>>
# Guardar y commitear
git add .
git commit -m "merge: resueltos conflictos"
```

Obsidian muestra los conflictos como texto plano. Buscá los marcadores y elegí la versión correcta.

---

## 📱 Alternativa: Obsidian Git Plugin

Si preferís no usar la terminal, instalá el plugin **"Obsidian Git"**:

1. Settings → Community Plugins → Browse
2. Buscar "Obsidian Git"
3. Instalar y activar
4. Configurar auto-commit/push cada X minutos

---

_Última actualización: 14/02/2025_
