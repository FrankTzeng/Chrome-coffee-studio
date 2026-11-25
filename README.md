# Chrome Coffee Studio — website

Static site for Chrome Coffee Studio (Torrance, CA), hosted on Render as a Static Site.

- `index.html` — the whole page.
- `src-assets/` — the site photos/videos, stored as base64 text (`.b64`) so the repo stays plain-text friendly.
- `build.sh` — Render build step: decodes `src-assets/*.b64` back into real files under `public/assets/` and copies `index.html` next to them. Render publishes `public/` (see `render.yaml`).
- To preview locally: run `bash build.sh`, then open `public/index.html` via any static file server.
