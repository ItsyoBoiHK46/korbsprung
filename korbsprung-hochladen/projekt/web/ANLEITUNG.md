# Korbsprung online stellen (kostenlos)

## 1. Supabase (Online-Rangliste)
1. Auf https://supabase.com ein kostenloses Konto anlegen und ein neues Projekt erstellen (Region z. B. "Central EU (Zurich)").
2. Links **SQL Editor** öffnen, den Inhalt von `schema.sql` einfügen, **Run** klicken.
3. **Authentication → Sign In / Providers**: «Allow anonymous sign-ins» einschalten und speichern.
4. **Project Settings → API** (bzw. «API Keys»): die **Project URL** und den **anon / publishable** Key kopieren.
   Niemals den **service_role / secret** Key verwenden oder weitergeben.
5. Beide Werte in `config.js` eintragen (oder Claude geben, dann trägt Claude sie ein).

## 2. GitHub Pages (Website)
1. Auf https://github.com ein kostenloses Konto anlegen.
2. Neues Repository **korbsprung** anlegen, Sichtbarkeit **Public**.
3. «uploading an existing file» wählen und `index.html` und `config.js` aus diesem Ordner hochladen, «Commit changes».
4. **Settings → Pages**: Source «Deploy from a branch», Branch **main**, Ordner **/(root)**, Save.
5. Nach 1–2 Minuten läuft das Spiel unter `https://<dein-name>.github.io/korbsprung/`.

## Einträge löschen
Im Supabase-Dashboard unter **Table Editor → scores** eine Zeile auswählen und löschen.
