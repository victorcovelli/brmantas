-- Tabela de palpites por participante/rodada
create table if not exists predictions (
  participant_id text not null,
  round_id       text not null,
  preds          jsonb not null default '{}',
  updated_at     timestamptz default now(),
  primary key (participant_id, round_id)
);

-- Tabela de resultados oficiais por jogo
create table if not exists results (
  game_id    text primary key,
  home       text,
  away       text,
  updated_at timestamptz default now()
);

-- Tabela de especiais por participante
create table if not exists specials (
  participant_id text primary key,
  answers        jsonb not null default '{}',
  updated_at     timestamptz default now()
);

-- Tabela de configurações genéricas (pins, deadlines, special_results)
create table if not exists config (
  key        text primary key,
  value      jsonb not null default '{}',
  updated_at timestamptz default now()
);

-- Habilitar acesso público (RLS desativado para simplicidade)
alter table predictions disable row level security;
alter table results     disable row level security;
alter table specials    disable row level security;
alter table config      disable row level security;
