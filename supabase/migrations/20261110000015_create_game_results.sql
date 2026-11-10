-- 20260923000012_create_game_results.sql
-- Resultados detallados de cada sesion de juego
-- ============================================================

create table public.game_results (
    id uuid primary key default gen_random_uuid(),

    session_id uuid not null unique
        references public.game_sessions(id)
        on delete cascade,

    user_id uuid not null
        references public.profiles(id)
        on delete cascade,

    exercise_id bigint not null
        references public.exercises(id)
        on delete restrict,

    difficulty_level integer not null,

    score integer not null default 0,
    accuracy numeric(5,2) not null default 0.00
        constraint game_results_accuracy_check
        check (accuracy >= 0 and accuracy <= 100),

    correct_answers integer not null default 0,
    incorrect_answers integer not null default 0,
    missed_answers integer not null default 0,

    avg_reaction_time_ms integer,

    metrics jsonb not null default '{}'::jsonb,

    created_at timestamptz not null default now()
);

comment on table public.game_results is
'Resultados y metricas obtenidas al completar una sesion de juego.';

comment on column public.game_results.accuracy is
'Porcentaje de precision entre 0.00 y 100.00.';

comment on column public.game_results.metrics is
'Metricas especificas adicionales del ejercicio en formato JSONB (ej. span maximo, errores de comision).';
