# Cognitive App

Mobile cognitive-training application built with Flutter and Supabase.

## Architecture

- Flutter for the mobile application.
- Supabase Auth for authentication.
- PostgreSQL/Supabase for application data.
- Timestamped SQL migrations in `supabase/migrations`.
- `dev` branch deploys to Supabase DEV.
- `main` branch deploys to Supabase PROD.
- Feature branches are merged into `dev` through pull requests.
- Only `dev` is allowed as the source branch for pull requests targeting `main`.

## Supabase migrations

All product catalog data that must exist in every environment is versioned as migrations. This includes:

- Languages.
- Cognitive categories.
- Exercises.
- Category translations.
- Exercise translations.

Development/test seed data can be added later as `supabase/seed.sql`; production deployments do not use `--include-seed`.

## Local setup

1. Install Flutter and the Supabase CLI.
2. Run:

```bash
flutter pub get
supabase start
supabase db reset
```

3. Run the app with runtime configuration:

```bash
flutter run \
  --dart-define=SUPABASE_URL="https://YOUR_PROJECT_REF.supabase.co" \
  --dart-define=SUPABASE_ANON_KEY="YOUR_PUBLIC_KEY"
```

Do not commit database passwords, service-role keys, access tokens, or `.env` files.

## GitHub environments

Create these environments and secrets:

### development

- `SUPABASE_DB_URL` → DEV database connection string.

### production

- `SUPABASE_DB_URL` → PROD database connection string.

The database URL is used only by GitHub Actions. It must not be placed in the Flutter application.

## Branch flow

```text
feature/*
   |
   | Pull Request
   v
 dev  -----------------> Supabase DEV
   |
   | Pull Request
   v
 main -----------------> Supabase PROD
```

## Important migration rule

Never edit a migration that has already been deployed to an environment. Create a new migration for every schema/data change.

## GitHub Actions

- `flutter-ci.yml` runs Flutter dependency installation, analysis, and tests on pushes/PRs for `dev` and `main`.
- `deploy-supabase-dev.yml` applies pending migrations to DEV after changes reach `dev`.
- `deploy-supabase-prod.yml` applies pending migrations to PROD after changes reach `main`.
- `only-dev-to-main.yml` ensures that a PR targeting `main` originates from `dev`.

See `docs/first-pr-checklist.md` before opening the first PR.
