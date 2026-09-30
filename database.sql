-- Corra este script uma vez em: Supabase -> SQL Editor -> New query -> Run

create table if not exists dados_empresa (
  id int primary key default 1,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

-- Garante que só existe a linha id=1 (uma "base de dados" partilhada pela empresa)
insert into dados_empresa (id, payload)
values (1, '{}'::jsonb)
on conflict (id) do nothing;

-- Ativa Row Level Security (obrigatório para segurança)
alter table dados_empresa enable row level security;

-- Qualquer utilizador autenticado (que tenha login válido) pode ler
create policy "leitura para autenticados"
on dados_empresa for select
to authenticated
using (true);

-- Qualquer utilizador autenticado pode gravar/atualizar
create policy "escrita para autenticados"
on dados_empresa for all
to authenticated
using (true)
with check (true);
