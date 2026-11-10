-- 20260923000015_create_streaks.sql
-- Rachas diarias de entrenamiento del usuario
-- ============================================================

create table public.streaks (
    user_id uuid primary key
        references public.profiles(id)
        on delete cascade,

    current_streak integer not null default 0,
    longest_streak integer not null default 0,

    last_activity_date date,

    updated_at timestamptz not null default now()
);

comment on table public.streaks is
'Seguimiento de la racha de dias consecutivos entrenando por usuario.';
