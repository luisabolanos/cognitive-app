-- 20260923000009_create_rls_policies.sql
-- Row Level Security
-- ============================================================

-- ============================================================
-- LANGUAGES
-- ============================================================

alter table public.languages enable row level security;

create policy "Authenticated users can view active languages"
on public.languages
for select
to authenticated
using (
    is_active = true
);


-- ============================================================
-- EXERCISE CATEGORIES
-- ============================================================

alter table public.exercise_categories enable row level security;

create policy "Authenticated users can view exercise categories"
on public.exercise_categories
for select
to authenticated
using (true);


-- ============================================================
-- EXERCISE CATEGORY TRANSLATIONS
-- ============================================================

alter table public.exercise_category_translations enable row level security;

create policy "Authenticated users can view category translations"
on public.exercise_category_translations
for select
to authenticated
using (true);


-- ============================================================
-- EXERCISES
-- ============================================================

alter table public.exercises enable row level security;

create policy "Authenticated users can view active exercises"
on public.exercises
for select
to authenticated
using (
    is_active = true
);


-- ============================================================
-- EXERCISE TRANSLATIONS
-- ============================================================

alter table public.exercise_translations enable row level security;

create policy "Authenticated users can view exercise translations"
on public.exercise_translations
for select
to authenticated
using (true);


-- ============================================================
-- EXERCISE CONFIGURATIONS
-- ============================================================

alter table public.exercise_configurations enable row level security;

create policy "Authenticated users can view exercise configurations"
on public.exercise_configurations
for select
to authenticated
using (true);
