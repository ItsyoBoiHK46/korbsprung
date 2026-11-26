# Korbsprung – Projektnotizen (Stand 26.11.2026)

Basketball-Hochsprungspiel (eigenes Spiel im Endlos-Hochsprung-Genre) im Look eines Risographie-Streetball-Plakats.
Figur springt automatisch von plattgedrückten Basketbällen nach oben, Spieler steuert links/rechts.

## Live
- **Website (Hauptversion):** https://itsyoboihk46.github.io/korbsprung/
  - GitHub-Repo: `ItsyoBoiHK46/korbsprung` (öffentlich), Branch `main`, GitHub Pages aus `/ (root)`.
  - Im Repo liegen nur `index.html` und `config.js` (aus `web/`).
  - Hochladen bisher von Hand über die GitHub-Upload-Seite (kein `gh`, kein git-Push eingerichtet).
- **Online-Rangliste:** Supabase-Projekt `https://bpgnsdvfttbdtmunfgpq.supabase.co`, Publishable Key in `web/config.js`
  (öffentlich gedacht). Secret/service_role Key niemals verwenden oder anfragen.
  - Tabelle `public.scores` (player_id = anonyme Supabase-Auth-User-ID, name, skin, score, updated_at), Schema in `web/schema.sql`.
  - Jedes Gerät meldet sich anonym an (Anonymous sign-ins sind eingeschaltet) und darf nur seinen eigenen Eintrag schreiben.
  - Realtime ist für `scores` eingeschaltet.
- Ältere Claude-Artifact-Versionen (laufen weiter, unabhängig): mit Claude-DB-Rangliste
  https://claude.ai/artifact/LY97uFVc9MVsyrzHJyZcqH, öffentliche Freispiel-Version https://claude.ai/artifact/YWNGiRWGMvM4zzngEodUVU

## Wo liegt was (ab 26.11.2026)
- **Alles liegt nur noch auf GitHub**, der Mac-Ordner `~/Developer/korb-sprung` wurde gelöscht.
- Website: `index.html` + `config.js` im Repo-Hauptordner (GitHub Pages).
- Quellcode und Notizen: Ordner `projekt/` im selben Repo (öffentlich sichtbar, enthält keine Geheimnisse).
- Für ein neues Update: Repo als ZIP herunterladen (Code → Download ZIP), im Ordner `projekt/` `src/game.html` ändern, `./build.sh` ausführen, `web/index.html` als `index.html` hochladen und geänderte Projektdateien in `projekt/` mit hochladen.

## Dateien
- `src/game.html` – **Quellcode, nur hier ändern.** Platzhalter `__FONT__` für die eingebettete Schrift.
- `build.sh` – baut daraus `index.html` (lokal, Doppelklick), `korbsprung.html` (Claude-Artifact) und `web/index.html` (Website mit Supabase-Bibliothek + `config.js`).
  `korbsprung-freispiel.html` entsteht nicht automatisch (Kopie von `korbsprung.html` mit anderem `<title>`).
- `web/` – Website-Dateien, `schema.sql`, `ANLEITUNG.md`.
- `assets/fonts/` – Big Shoulders Stencil (wird als base64 eingebettet).
- `PRODUCT.md`, `DESIGN.md`, `.impeccable/` – Design-Grundlagen (Impeccable-Skill).

## Funktionen
- Namenseingabe (Pflicht beim ersten Start), 4 Skins: curry (30), lebron (23), jordan (23), kobe (24) – eigene Zeichnungen, keine Logos/Fotos.
- Extras: Sneaker (höher springen), Kochmütze (Raketenflug), Korb (Splash +150), Verteidiger (drüberspringen +75), schlaffe Bälle platzen.
- Rangliste: Supabase (Website) → Claude-DB (Artifact) → Fallback pro Gerät (localStorage `korbsprung.board`).
- localStorage `korbsprung.v1`: best, bestH, muted, name, skin, theme (`light`/`dark`, fehlt = Systemeinstellung).

## Update 26.11.2026 (Darkmode, Podest, Pokale, Spieler-Welten)
- Darkmode: Mond/Sonne-Knopf oben rechts, startet nach Systemeinstellung, Wahl wird gespeichert.
- Rangliste: Start- und Endbildschirm zeigen nur die Top 3 als Podest (Gold/Silber/Bronze-Pokal) plus «Du: Platz N»; der Tab «Rangliste» zeigt Podest + alle ab Platz 4.
- Pokale nur für den Allzeit-Rekord aller Spieler (nicht eigener Rekord): Rekordlinie «Rekord aller» im Spiel, Konfetti beim Knacken, Gold/Silber/Bronze beim Spielende wenn man in die Top 3 kommt.
- Welt pro Spieler (`THEMES` in `src/game.html`): Curry «Splash», LeBron «König», Jordan «Flugshow», Kobe «Mamba» – Knopffarben, Platz, Hintergrund-Motive, Sprüche, Sprungspur.
- Keine Schema-Änderung nötig. Sicherung des Stands davor in `backup/`.

## Updates ohne Datenverlust
- Rangliste liegt in Supabase, nicht in `index.html`: neue `index.html` hochladen löscht keine Einträge.
- Kompatibel bleiben: Tabelle/Spalten `scores(player_id, name, skin, score)`, Skin-Kennungen, localStorage-Schlüssel nicht umbenennen.
- Neuer Skin braucht zusätzlich eine Schema-Änderung (`check (skin in (...))`) in Supabase **vor** dem Upload.
- Ablauf: `src/game.html` ändern → `./build.sh` → lokal testen (Vorschau „korbsprung“ in `.claude/launch.json` des Bewerbungsordners, Port 7801, `/web/`) → `web/index.html` hochladen → 1–2 Min warten.
- Rückgängig: in GitHub die alte `index.html`-Version wiederherstellen (Commit-Historie).
