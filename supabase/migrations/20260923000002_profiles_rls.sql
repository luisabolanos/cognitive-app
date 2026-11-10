-- 20260923000002_profiles_rls.sql
-- Seguridad de la tabla profiles
-- ============================================================

alter table public.profiles enable row level security;

create policy "Users can view their own profile"
on public.profiles
for select
to authenticated
using (
    auth.uid() = id
);

create policy "Users can create their own profile"
on public.profiles
for insert
to authenticated
with check (
    auth.uid() = id
);

create policy "Users can update their own profile"
on public.profiles
for update
to authenticated
using (
    auth.uid() = id
)
with check (
    auth.uid() = id
);
