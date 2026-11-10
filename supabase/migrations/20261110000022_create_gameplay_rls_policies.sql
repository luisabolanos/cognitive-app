-- 20260923000019_create_gameplay_rls_policies.sql
-- Politicas RLS para sesiones, resultados, progreso, rachas, logros y rankings
-- ============================================================

-- ============================================================
-- GAME SESSIONS
-- ============================================================
alter table public.game_sessions enable row level security;

create policy "Users can view own game sessions"
on public.game_sessions for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own game sessions"
on public.game_sessions for insert to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own game sessions"
on public.game_sessions for update to authenticated
using (auth.uid() = user_id);


-- ============================================================
-- GAME RESULTS
-- ============================================================
alter table public.game_results enable row level security;

create policy "Users can view own game results"
on public.game_results for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own game results"
on public.game_results for insert to authenticated
with check (auth.uid() = user_id);


-- ============================================================
-- USER PROGRESS
-- ============================================================
alter table public.user_progress enable row level security;

create policy "Users can view own progress"
on public.user_progress for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own progress"
on public.user_progress for insert to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own progress"
on public.user_progress for update to authenticated
using (auth.uid() = user_id);


-- ============================================================
-- USER STATS
-- ============================================================
alter table public.user_stats enable row level security;

create policy "Users can view own stats"
on public.user_stats for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own stats"
on public.user_stats for insert to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own stats"
on public.user_stats for update to authenticated
using (auth.uid() = user_id);


-- ============================================================
-- STREAKS
-- ============================================================
alter table public.streaks enable row level security;

create policy "Users can view own streaks"
on public.streaks for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own streaks"
on public.streaks for insert to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own streaks"
on public.streaks for update to authenticated
using (auth.uid() = user_id);


-- ============================================================
-- ACHIEVEMENTS & TRANSLATIONS
-- ============================================================
alter table public.achievements enable row level security;

create policy "Authenticated users can view active achievements"
on public.achievements for select to authenticated
using (is_active = true);

alter table public.achievement_translations enable row level security;

create policy "Authenticated users can view achievement translations"
on public.achievement_translations for select to authenticated
using (true);


-- ============================================================
-- USER ACHIEVEMENTS
-- ============================================================
alter table public.user_achievements enable row level security;

create policy "Users can view own achievements"
on public.user_achievements for select to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own achievements"
on public.user_achievements for insert to authenticated
with check (auth.uid() = user_id);


-- ============================================================
-- LEADERBOARDS
-- ============================================================
alter table public.leaderboards enable row level security;

create policy "Authenticated users can view leaderboards"
on public.leaderboards for select to authenticated
using (true);

create policy "Users can insert own leaderboard entry"
on public.leaderboards for insert to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own leaderboard entry"
on public.leaderboards for update to authenticated
using (auth.uid() = user_id);
