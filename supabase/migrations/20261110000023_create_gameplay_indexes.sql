-- 20260923000020_create_gameplay_indexes.sql
-- Indices para optimizar consultas de sesiones, resultados, progreso y rankings
-- ============================================================

-- Game Sessions
create index idx_game_sessions_user
on public.game_sessions(user_id);

create index idx_game_sessions_exercise
on public.game_sessions(exercise_id);

create index idx_game_sessions_user_started
on public.game_sessions(user_id, started_at desc);

-- Game Results
create index idx_game_results_user_exercise
on public.game_results(user_id, exercise_id);

create index idx_game_results_created_at
on public.game_results(created_at desc);

-- User Progress
create index idx_user_progress_user
on public.user_progress(user_id);

create index idx_user_progress_exercise
on public.user_progress(exercise_id);

-- User Achievements
create index idx_user_achievements_user
on public.user_achievements(user_id);

-- Leaderboards
create index idx_leaderboards_Global_score
on public.leaderboards(period, score desc)
where exercise_id is null;

create index idx_leaderboards_exercise_score
on public.leaderboards(exercise_id, period, score desc)
where exercise_id is not null;
