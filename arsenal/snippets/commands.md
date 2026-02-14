# 💻 Snippets Útiles

> Colección de comandos y scripts para operación rápida.

---

## Maxun

### API con curl

```bash
# Test de health
curl http://100.73.185.25:8080/health

# Usar API Key
curl -H "x-api-key: fXZVc9bd375Z9RHivdxAhLqHgXnOXXnA" \
     http://100.73.185.25:8080/api/robots
```

### Node.js SDK

```javascript
import { Maxun } from '@maxun/node-sdk';

const maxun = new Maxun({
  apiKey: 'fXZVc9bd375Z9RHivdxAhLqHgXnOXXnA',
  baseUrl: 'http://100.73.185.25:8080'
});

// Extraer datos
const data = await maxun.extract('https://example.com', {
  schema: {
    name: 'string',
    price: 'number'
  }
});
```

---

## Ollama

### Generación básica

```bash
curl -s http://100.73.185.25:11434/api/generate -d '{
  "model": "qwen3:8b",
  "prompt": "Hola",
  "stream": false
}' | jq -r '.response'
```

### Chat (conversación)

```bash
curl -s http://100.73.185.25:11434/api/chat -d '{
  "model": "qwen3:8b",
  "messages": [
    {"role": "user", "content": "Hola"}
  ],
  "stream": false
}' | jq -r '.message.content'
```

### Listar modelos

```bash
curl -s http://100.73.185.25:11434/api/tags | jq '.models[].name'
```

---

## Docker (Windows)

```powershell
# Ver contenedores activos
docker ps

# Ver todos los contenedores (incluídos los detenidos)
docker ps -a

# Logs de un servicio específico
docker logs maxun-backend-1

# Reiniciar un contenedor
docker restart maxun-backend-1

# Ver uso de recursos
docker stats
```

---

## Tailscale

```powershell
# Ver estado
tailscale status

# Ver IP
tailscale ip

# Habilitar SSH (como admin)
tailscale up --ssh

# Deshabilitar SSH
tailscale up --ssh=false
```

---

## PowerShell

```powershell
# Ver uso de memoria
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10

# Ver procesos que usan GPU
Get-Process | Where-Object {$_.ProcessName -like "*ollama*" -or $_.ProcessName -like "*docker*"}

# Test de conectividad
Test-NetConnection -ComputerName 100.73.185.25 -Port 11434
```

---

*Última actualización: 14/02/2026*
