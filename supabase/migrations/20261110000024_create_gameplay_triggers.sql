-- 20261110000024_create_gameplay_triggers.sql
-- Triggers de updated_at e inicializacion automatica de stats y streaks
-- ============================================================

create trigger user_progress_set_updated_at
before update on public.user_progress
for each row
execute function public.set_updated_at();

create trigger user_stats_set_updated_at
before update on public.user_stats
for each row
execute function public.set_updated_at();

create trigger streaks_set_updated_at
before update on public.streaks
for each row
execute function public.set_updated_at();

create trigger leaderboards_set_updated_at
before update on public.leaderboards
for each row
execute function public.set_updated_at();


-- ============================================================
-- Inicializar user_stats y streaks al crear un perfil
-- ============================================================

create or replace function public.handle_new_profile_stats()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
    insert into public.user_stats (user_id)
    values (new.id)
    on conflict (user_id) do nothing;

    insert into public.streaks (user_id)
    values (new.id)
    on conflict (user_id) do nothing;

    return new;
end;
$$;

create trigger on_profile_created_init_stats
after insert on public.profiles
for each row
execute function public.handle_new_profile_stats();
