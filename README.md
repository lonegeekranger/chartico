# Chartico - Generador de organigramas

## 1. Descripción

Proyecto estático (sin build ni dependencias de Node) para visualizar organigramas de forma simple y portable.

Archivos principales:

- `src/index.html`: estructura base y lógica de render.
- `src/styles.css`: estilos del organigrama y tema claro/oscuro.
- `data/org.yaml`: fuente de datos (personas, jerarquía y temas).
- `scripts/serve.sh`: script para servir el proyecto localmente.

## 2. Como funciona org.yaml

`org.yaml` define todo el contenido visual del organigrama:

- `meta`: título y textos de cabecera (`title`, `area`, `team`).
- `themes`: paletas por tipo de tarjeta (colores de header/body, borde, modo oscuro opcional).
- `root`: nodo principal del organigrama.
- `columns`: columnas hijas del nodo principal.
- `members`: integrantes de una columna o líder.

Campos típicos de un nodo:

- `name`, `role`, `func`, `theme`
- opcionales: `badge` (`E` o `NEW`), `emoji`
- puede incluir `members` o `columns` para anidar estructura.

Al cargar la página, `src/index.html` hace `fetch('../data/org.yaml')`, lo parsea con `js-yaml` y construye el DOM dinámicamente.

## 3. Como se sirve la página

Desde la raíz del proyecto, ejecuta:

```bash
./scripts/serve.sh
```

Esto levanta un servidor HTTP local en el puerto 8000. Luego abre en tu navegador:

```
http://localhost:8000/src/
```

### Configuración personalizada

- Edita `data/org.yaml` para cambiar la estructura y contenido del organigrama.
- La página busca automáticamente el archivo en `data/org.yaml` al cargar.
- El servidor debe ejecutarse desde la raíz para que las rutas relativas (`../data/org.yaml`) funcionen correctamente.
