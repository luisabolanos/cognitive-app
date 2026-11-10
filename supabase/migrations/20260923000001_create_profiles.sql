-- 20260923000001_create_profiles.sql
-- Tabla de perfiles de usuario
-- ============================================================

create table public.profiles (
    id uuid primary key
        references auth.users(id)
        on delete cascade,

    username varchar(50) unique,
    display_name varchar(100),
    avatar_url text,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

comment on table public.profiles is
'Informacion del perfil del usuario. La autenticacion es gestionada por Supabase Auth.';

comment on column public.profiles.id is
'UUID del usuario en auth.users.';

comment on column public.profiles.username is
'Nombre de usuario unico dentro de la aplicacion.';

comment on column public.profiles.display_name is
'Nombre que se muestra en la aplicacion.';

comment on column public.profiles.avatar_url is
'URL del avatar del usuario.';
