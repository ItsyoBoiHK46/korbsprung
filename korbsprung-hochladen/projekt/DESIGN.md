# Design

Welt: Risographie-Plakat für ein Streetball-Turnier. Alles ist «gedruckt»: Schmuckfarben auf Papier, die sich beim Überlappen mischen.

## Farben (Druckfarben)

| Rolle | Wert | Einsatz |
|---|---|---|
| Papier | `#eeeee8` | Grund, mit Körnung und Fasern; Aussparungen zeigen das Papier |
| Pink (Fluoreszenz) | `#ff48b0` | Zweiter Druckgang, Akzente, Rekordlinie; nie für kleinen Text (zu wenig Kontrast) |
| Blau | `#3d5fb0` | Hauptfarbe für Text, Linien, Halbtonraster, Knöpfe |
| Gelb | `#ffe100` | Grosse Zahlen, Nummer 30, Höhenmarken, Sneaker |
| Schwarz (Key) | `#2a2430` | Sparsam: Haare, Korbbrett, Schuhe |
| Textblau | `#24306b` | Fliesstext im HTML |

- Alle Farben werden mit `multiply` überdruckt: Pink + Gelb = Basketball-Orange, Pink + Blau = Violett.
- Leichter Passerversatz pro Farbe (Pink +1.4/−1, Gelb −1.1/+1.2); bei der Spielfigur wächst der Versatz mit der Geschwindigkeit.
- Schattierung nur als Halbtonraster (Punkte), keine Verläufe.
- Je höher man kommt, desto mehr Farbschichten liegen über dem Papier (Gelb ab 2500, Pink ab 8000, Blau ab 16000 Höhe).

## Schrift

Big Shoulders Stencil (variabel 100–900), eingebettet. Titel 900 in Grossbuchstaben, zwei versetzte Druckgänge (Pink unten, Blau darüber). Zahlen im HUD stehen in festen Zellen, führende Nullen blass.

## Bauteile

- Knopf: blaue Fläche, Papierschrift, pinke Druckplatte leicht versetzt dahinter (mischt sich zu Violett). Zweitknopf: blaue Kontur auf gelber Platte.
- Fokus: gestrichelter Rahmen in Key-Schwarz.
- Einblendungen («Splash! +150»): zwei Druckgänge, die beim Erscheinen zusammenrücken.
- Plattformen: plattgedrückte Bälle (Gelb + Pink), blaue Nähte, Halbton unten, ausgesparter Glanzpunkt.
