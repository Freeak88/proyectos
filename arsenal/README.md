# 📚 Documentación del Arsenal

> Índice de recursos, guías y referencias.

---

## Estructura

```
arsenal/
├── README.md                 ← Este archivo
├── whitemonkey/
│   └── README.md            ← Especificaciones del nodo
├── workflows/
│   └── resource-management.md ← Flujos de trabajo
├── snippets/
│   └── commands.md          ← Comandos útiles
└── docs/                    ← Documentación adicional
```

---

## Recursos Documentados

### Nodos/Servidores

| Nodo | IP Tailscale | Rol | Estado |
|------|--------------|-----|--------|
| whitemonkey | 100.73.185.25 | Nodo Maestro (Windows) | 🟢 Activo |
| freeakplus | — | — | — |
| kali | — | — | — |
| vps-hostinger | — | VPS Cloud | — |

### Servicios

| Servicio | Nodo | Puerto | Propósito |
|----------|------|--------|-----------|
| Maxun | whitemonkey | 5173/8080 | Web Scraping |
| Ollama | whitemonkey | 11434 | IA Local |
| Supabase | whitemonkey | Varios | Backend/Data |
| Chatwoot | whitemonkey | Varios | CRM/Omnicanal |

---

## Guías

- [Gestión de recursos](./workflows/resource-management.md) — Cómo coordinar Ollama y Maxun
- [Comandos útiles](./snippets/commands.md) — Snippets para operación rápida

---

## Pendientes

- [ ] Documentar otros nodos (freekplus, kali, vps-hostinger)
- [ ] Crear guía de troubleshooting
- [ ] Automatizar scripts de control de recursos
- [ ] Configurar acceso SSH/Tailscale para control remoto

---

*Última actualización: 14/02/2026*
