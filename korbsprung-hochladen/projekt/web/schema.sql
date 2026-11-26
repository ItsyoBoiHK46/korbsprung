-- Korbsprung: Online-Rangliste
-- Im Supabase-Dashboard unter "SQL Editor" einfügen und auf "Run" klicken.

create table if not exists public.scores (
  player_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  name text not null check (char_length(name) between 1 and 16),
  skin text not null check (skin in ('curry', 'lebron', 'jordan', 'kobe')),
  score integer not null check (score between 1 and 200000),
  updated_at timestamptz not null default now()
);

alter table public.scores enable row level security;

-- Alle dürfen die Rangliste lesen.
create policy "Rangliste lesen" on public.scores
  for select to anon, authenticated using (true);

-- Jedes Gerät (anonym angemeldet) darf nur seinen eigenen Eintrag anlegen und ändern.
create policy "Eigenen Eintrag anlegen" on public.scores
  for insert to authenticated with check (player_id = auth.uid());

create policy "Eigenen Eintrag ändern" on public.scores
  for update to authenticated using (player_id = auth.uid()) with check (player_id = auth.uid());

-- Zugriffsrechte für die Website (anonyme Besucher lesen, angemeldete Geräte schreiben).
grant select on public.scores to anon, authenticated;
grant insert, update on public.scores to authenticated;

-- Live-Updates einschalten.
alter publication supabase_realtime add table public.scores;
