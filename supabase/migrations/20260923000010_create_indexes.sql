-- 20260923000010_create_indexes.sql
-- Indices
-- ============================================================

create index idx_category_translations_category
on public.exercise_category_translations(category_id);

create index idx_category_translations_language
on public.exercise_category_translations(language_id);

create index idx_category_translations_language_category
on public.exercise_category_translations(language_id, category_id);


create index idx_exercises_category
on public.exercises(category_id);

create index idx_exercises_active
on public.exercises(is_active);


create index idx_exercise_translations_exercise
on public.exercise_translations(exercise_id);

create index idx_exercise_translations_language
on public.exercise_translations(language_id);

create index idx_exercise_translations_language_exercise
on public.exercise_translations(language_id, exercise_id);


create index idx_exercise_configurations_exercise
on public.exercise_configurations(exercise_id);

create index idx_exercise_configurations_difficulty
on public.exercise_configurations(
    exercise_id,
    difficulty_level
);
