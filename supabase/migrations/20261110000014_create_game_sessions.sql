-- 20260923000011_create_game_sessions.sql
-- Sesiones de juego iniciadas por el usuario
-- ============================================================

create table public.game_sessions (
    id uuid primary key default gen_random_uuid(),

    user_id uuid not null
        references public.profiles(id)
        on delete cascade,

    exercise_id bigint not null
        references public.exercises(id)
        on delete restrict,

    difficulty_level integer not null default 1,

    status varchar(20) not null default 'in_progress'
        constraint game_sessions_status_check
        check (status in ('in_progress', 'completed', 'abandoned')),

    started_at timestamptz not null default now(),
    finished_at timestamptz,
    duration_ms integer,

    created_at timestamptz not null default now()
);

comment on table public.game_sessions is
'Registro de cada sesion de entrenamiento iniciada por un usuario.';

comment on column public.game_sessions.status is
'Estado de la sesion: in_progress, completed o abandoned.';

comment on column public.game_sessions.duration_ms is
'Duracion total de la sesion en milisegundos.';
