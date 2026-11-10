-- 20260923000011_create_updated_at_triggers.sql
-- Mantiene updated_at sincronizado automaticamente.
-- ============================================================

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
    new.updated_at = now();
    return new;
end;
$$;

create trigger profiles_set_updated_at
before update on public.profiles
for each row
execute function public.set_updated_at();

create trigger exercise_category_translations_set_updated_at
before update on public.exercise_category_translations
for each row
execute function public.set_updated_at();

create trigger exercises_set_updated_at
before update on public.exercises
for each row
execute function public.set_updated_at();

create trigger exercise_translations_set_updated_at
before update on public.exercise_translations
for each row
execute function public.set_updated_at();

create trigger exercise_configurations_set_updated_at
before update on public.exercise_configurations
for each row
execute function public.set_updated_at();
