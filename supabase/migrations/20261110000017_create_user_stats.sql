-- 20260923000014_create_user_stats.sql
-- Estadisticas globales y por categoria del usuario
-- ============================================================

create table public.user_stats (
    user_id uuid primary key
        references public.profiles(id)
        on delete cascade,

    total_score bigint not null default 0,
    total_sessions_completed integer not null default 0,
    total_time_played_ms bigint not null default 0,
    overall_accuracy numeric(5,2) not null default 0.00,

    category_scores jsonb not null default '{}'::jsonb,

    updated_at timestamptz not null default now()
);

comment on table public.user_stats is
'Resumen de estadisticas globales del usuario para carga rapida en perfil y dashboard.';

comment on column public.user_stats.category_scores is
'Puntajes o indices cognitivos desglosados por categoria en formato JSONB.';
