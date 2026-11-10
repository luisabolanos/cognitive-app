-- 20260923000012_create_auth_profile_trigger.sql
-- Crea automaticamente el perfil publico al registrar un usuario.
-- ============================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
    insert into public.profiles (id, display_name)
    values (
        new.id,
        nullif(new.raw_user_meta_data ->> 'display_name', '')
    );

    return new;
end;
$$;

create trigger on_auth_user_created
after insert on auth.users
for each row
execute function public.handle_new_user();
