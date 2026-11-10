-- 20261110000025_seed_configurations_and_achievements.sql
-- Configuraciones iniciales de dificultad por ejercicio y catalogo de logros
-- Se versiona como migracion para aplicarse automaticamente en el workflow CI/CD.
-- ============================================================

-- ============================================================
-- 1. EXERCISE CONFIGURATIONS (Niveles 1, 2 y 3 base para los 20 ejercicios)
-- ============================================================

insert into public.exercise_configurations (exercise_id, difficulty_level, configuration)
select
    e.id,
    v.difficulty_level,
    v.configuration::jsonb
from (
    values
        -- N_BACK
        ('N_BACK', 1, '{"n": 1, "trials": 15, "stimulus_duration_ms": 1500, "inter_stimulus_ms": 1000}'),
        ('N_BACK', 2, '{"n": 2, "trials": 20, "stimulus_duration_ms": 1200, "inter_stimulus_ms": 1000}'),
        ('N_BACK', 3, '{"n": 3, "trials": 25, "stimulus_duration_ms": 1000, "inter_stimulus_ms": 800}'),

        -- SEQUENCE_MEMORY
        ('SEQUENCE_MEMORY', 1, '{"grid_size": 3, "initial_length": 3, "max_length": 6, "display_speed_ms": 800}'),
        ('SEQUENCE_MEMORY', 2, '{"grid_size": 4, "initial_length": 4, "max_length": 8, "display_speed_ms": 650}'),
        ('SEQUENCE_MEMORY', 3, '{"grid_size": 4, "initial_length": 5, "max_length": 10, "display_speed_ms": 500}'),

        -- SPATIAL_MEMORY
        ('SPATIAL_MEMORY', 1, '{"grid_size": 3, "targets_count": 3, "memorize_time_ms": 2000, "rounds": 5}'),
        ('SPATIAL_MEMORY', 2, '{"grid_size": 4, "targets_count": 5, "memorize_time_ms": 1800, "rounds": 6}'),
        ('SPATIAL_MEMORY', 3, '{"grid_size": 5, "targets_count": 7, "memorize_time_ms": 1500, "rounds": 8}'),

        -- SELECTIVE_ATTENTION
        ('SELECTIVE_ATTENTION', 1, '{"trials": 20, "distractors_count": 4, "time_limit_ms": 3000}'),
        ('SELECTIVE_ATTENTION', 2, '{"trials": 30, "distractors_count": 8, "time_limit_ms": 2200}'),
        ('SELECTIVE_ATTENTION', 3, '{"trials": 40, "distractors_count": 12, "time_limit_ms": 1600}'),

        -- VISUAL_SEARCH
        ('VISUAL_SEARCH', 1, '{"items_count": 9, "rounds": 10, "time_limit_ms": 5000}'),
        ('VISUAL_SEARCH', 2, '{"items_count": 16, "rounds": 12, "time_limit_ms": 4000}'),
        ('VISUAL_SEARCH', 3, '{"items_count": 25, "rounds": 15, "time_limit_ms": 3500}'),

        -- GO_NO_GO
        ('GO_NO_GO', 1, '{"trials": 25, "go_probability": 0.75, "stimulus_duration_ms": 1200}'),
        ('GO_NO_GO', 2, '{"trials": 35, "go_probability": 0.80, "stimulus_duration_ms": 900}'),
        ('GO_NO_GO', 3, '{"trials": 50, "go_probability": 0.80, "stimulus_duration_ms": 700}'),

        -- STROOP
        ('STROOP', 1, '{"trials": 20, "incongruent_ratio": 0.5, "time_limit_ms": 3000}'),
        ('STROOP', 2, '{"trials": 30, "incongruent_ratio": 0.65, "time_limit_ms": 2200}'),
        ('STROOP', 3, '{"trials": 40, "incongruent_ratio": 0.75, "time_limit_ms": 1600}'),

        -- TASK_SWITCHING
        ('TASK_SWITCHING', 1, '{"trials": 20, "switch_probability": 0.3, "time_limit_ms": 3500}'),
        ('TASK_SWITCHING', 2, '{"trials": 30, "switch_probability": 0.5, "time_limit_ms": 2500}'),
        ('TASK_SWITCHING', 3, '{"trials": 40, "switch_probability": 0.6, "time_limit_ms": 1800}'),

        -- REACTION_TIME
        ('REACTION_TIME', 1, '{"trials": 10, "min_delay_ms": 1500, "max_delay_ms": 3500}'),
        ('REACTION_TIME', 2, '{"trials": 15, "min_delay_ms": 1000, "max_delay_ms": 4000}'),
        ('REACTION_TIME', 3, '{"trials": 20, "min_delay_ms": 800, "max_delay_ms": 4500}'),

        -- SYMBOL_DIGIT
        ('SYMBOL_DIGIT', 1, '{"symbols_count": 6, "duration_seconds": 60}'),
        ('SYMBOL_DIGIT', 2, '{"symbols_count": 9, "duration_seconds": 60}'),
        ('SYMBOL_DIGIT', 3, '{"symbols_count": 9, "duration_seconds": 90}'),

        -- LOGIC_SERIES
        ('LOGIC_SERIES', 1, '{"questions_count": 8, "time_per_question_s": 30}'),
        ('LOGIC_SERIES', 2, '{"questions_count": 10, "time_per_question_s": 25}'),
        ('LOGIC_SERIES', 3, '{"questions_count": 12, "time_per_question_s": 20}'),

        -- VISUAL_MATRICES
        ('VISUAL_MATRICES', 1, '{"matrix_size": 2, "questions_count": 8, "time_per_question_s": 35}'),
        ('VISUAL_MATRICES', 2, '{"matrix_size": 3, "questions_count": 10, "time_per_question_s": 30}'),
        ('VISUAL_MATRICES', 3, '{"matrix_size": 3, "questions_count": 12, "time_per_question_s": 25}'),

        -- MENTAL_ROTATION
        ('MENTAL_ROTATION', 1, '{"trials": 12, "angles": [90, 180], "time_limit_ms": 6000}'),
        ('MENTAL_ROTATION', 2, '{"trials": 16, "angles": [45, 90, 135, 180], "time_limit_ms": 5000}'),
        ('MENTAL_ROTATION', 3, '{"trials": 20, "angles": [30, 60, 120, 150, 240], "time_limit_ms": 4000}'),

        -- CORSI_BLOCKS
        ('CORSI_BLOCKS', 1, '{"blocks_count": 9, "initial_span": 3, "max_span": 6, "flash_ms": 800}'),
        ('CORSI_BLOCKS', 2, '{"blocks_count": 9, "initial_span": 4, "max_span": 7, "flash_ms": 650}'),
        ('CORSI_BLOCKS', 3, '{"blocks_count": 12, "initial_span": 5, "max_span": 9, "flash_ms": 500}'),

        -- VERBAL_MEMORY
        ('VERBAL_MEMORY', 1, '{"words_pool": 15, "trials": 20, "time_limit_ms": 4000}'),
        ('VERBAL_MEMORY', 2, '{"words_pool": 25, "trials": 30, "time_limit_ms": 3000}'),
        ('VERBAL_MEMORY', 3, '{"words_pool": 40, "trials": 45, "time_limit_ms": 2500}'),

        -- VERBAL_FLUENCY
        ('VERBAL_FLUENCY', 1, '{"duration_seconds": 60, "target_words": 8}'),
        ('VERBAL_FLUENCY', 2, '{"duration_seconds": 60, "target_words": 12}'),
        ('VERBAL_FLUENCY', 3, '{"duration_seconds": 60, "target_words": 16}'),

        -- TRAIL_MAKING
        ('TRAIL_MAKING', 1, '{"nodes_count": 12, "mode": "numbers_only", "time_limit_s": 60}'),
        ('TRAIL_MAKING', 2, '{"nodes_count": 16, "mode": "alternating", "time_limit_s": 75}'),
        ('TRAIL_MAKING', 3, '{"nodes_count": 24, "mode": "alternating", "time_limit_s": 90}'),

        -- TOWER_PLANNING
        ('TOWER_PLANNING', 1, '{"disks_count": 3, "puzzles_count": 3, "min_moves": 7}'),
        ('TOWER_PLANNING', 2, '{"disks_count": 4, "puzzles_count": 3, "min_moves": 15}'),
        ('TOWER_PLANNING', 3, '{"disks_count": 5, "puzzles_count": 3, "min_moves": 31}'),

        -- PROBLEM_SOLVING
        ('PROBLEM_SOLVING', 1, '{"problems_count": 5, "time_per_problem_s": 45}'),
        ('PROBLEM_SOLVING', 2, '{"problems_count": 8, "time_per_problem_s": 35}'),
        ('PROBLEM_SOLVING', 3, '{"problems_count": 10, "time_per_problem_s": 30}'),

        -- DIGIT_SPAN
        ('DIGIT_SPAN', 1, '{"mode": "forward", "initial_digits": 3, "max_digits": 6, "display_ms": 1000}'),
        ('DIGIT_SPAN', 2, '{"mode": "both", "initial_digits": 4, "max_digits": 8, "display_ms": 800}'),
        ('DIGIT_SPAN', 3, '{"mode": "backward", "initial_digits": 5, "max_digits": 9, "display_ms": 650}')
) as v(exercise_code, difficulty_level, configuration)
join public.exercises e
    on e.code = v.exercise_code
on conflict (exercise_id, difficulty_level) do nothing;


-- ============================================================
-- 2. ACHIEVEMENTS CATALOG
-- ============================================================

insert into public.achievements (code, icon_name, condition_type, condition_value, is_active)
values
    ('FIRST_SESSION', 'rocket_launch', 'sessions_count', 1, true),
    ('SESSIONS_10', 'military_tech', 'sessions_count', 10, true),
    ('SESSIONS_50', 'workspace_premium', 'sessions_count', 50, true),
    ('STREAK_3', 'local_fire_department', 'streak_days', 3, true),
    ('STREAK_7', 'whatshot', 'streak_days', 7, true),
    ('STREAK_30', 'emoji_events', 'streak_days', 30, true),
    ('PERFECT_ACCURACY', 'verified', 'perfect_accuracy', 100, true)
on conflict (code) do nothing;

-- Traducciones de logros (Español)
insert into public.achievement_translations (achievement_id, language_id, name, description)
select
    a.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('FIRST_SESSION', 'Primer paso', 'Completa tu primera sesión de entrenamiento cognitivo.'),
        ('SESSIONS_10', 'Mente en marcha', 'Completa 10 sesiones de entrenamiento.'),
        ('SESSIONS_50', 'Entrenador constante', 'Completa 50 sesiones de entrenamiento.'),
        ('STREAK_3', 'Racha de 3 días', 'Entrena durante 3 días consecutivos.'),
        ('STREAK_7', 'Semana perfecta', 'Mantén una racha de 7 días consecutivos.'),
        ('STREAK_30', 'Hábito maestro', 'Alcanza una racha de 30 días consecutivos.'),
        ('PERFECT_ACCURACY', 'Precisión absoluta', 'Obtén un 100% de precisión en cualquier ejercicio.')
) as v(achievement_code, name, description)
join public.achievements a on a.code = v.achievement_code
join public.languages l on l.code = 'es'
on conflict (achievement_id, language_id) do nothing;

-- Traducciones de logros (Inglés)
insert into public.achievement_translations (achievement_id, language_id, name, description)
select
    a.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('FIRST_SESSION', 'First Step', 'Complete your first cognitive training session.'),
        ('SESSIONS_10', 'Mind in Motion', 'Complete 10 training sessions.'),
        ('SESSIONS_50', 'Consistent Trainer', 'Complete 50 training sessions.'),
        ('STREAK_3', '3-Day Streak', 'Train for 3 consecutive days.'),
        ('STREAK_7', 'Perfect Week', 'Maintain a 7-day training streak.'),
        ('STREAK_30', 'Master Habit', 'Reach a 30-day consecutive streak.'),
        ('PERFECT_ACCURACY', 'Flawless Accuracy', 'Achieve 100% accuracy in any exercise.')
) as v(achievement_code, name, description)
join public.achievements a on a.code = v.achievement_code
join public.languages l on l.code = 'en'
on conflict (achievement_id, language_id) do nothing;
