#!/bin/sh
# Baut index.html aus src/game.html und bettet die Schrift ein.
cd "$(dirname "$0")" && /usr/bin/python3 -I -c "
import base64,pathlib
s=pathlib.Path('src/game.html').read_text()
f=base64.b64encode(pathlib.Path('assets/fonts/big-shoulders-stencil-latin.woff2').read_bytes()).decode()
pathlib.Path('index.html').write_text(s.replace('__FONT__',f))"
# Artifact-Fassung: ohne eigenes Dokument-Gerüst (das Artifact setzt es selbst)
/usr/bin/python3 -I -c "
import pathlib,re
s=pathlib.Path('index.html').read_text()
s=s.replace('<!doctype html>\n<html lang=\"de\">\n<head>\n<meta charset=\"utf-8\">\n','',1)
s=re.sub(r'<meta name=\"viewport\"[^>]*>\n','',s,1)
s=s.replace('</head>\n<body>\n','',1).replace('</body>\n</html>\n','')
pathlib.Path('korbsprung.html').write_text(s)"
# Website-Fassung (GitHub Pages + Supabase): index.html mit Supabase-Bibliothek und config.js
/usr/bin/python3 -I -c "
import pathlib
s=pathlib.Path('index.html').read_text()
inj='<script src=\"https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.45.4/dist/umd/supabase.js\"></script>\n<script src=\"config.js\"></script>\n<script>\n(() => {'
pathlib.Path('web').mkdir(exist_ok=True)
pathlib.Path('web/index.html').write_text(s.replace('<script>\n(() => {',inj,1))"
