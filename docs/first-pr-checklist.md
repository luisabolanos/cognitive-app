# First PR checklist

This branch contains the initial application structure, Supabase migrations, catalog data, CI/CD workflows, and branch-flow validation.

## Before creating the first PR

1. Run `flutter pub get`.
2. Run `flutter analyze`.
3. Run `flutter test`.
4. Start the local Supabase stack with `supabase start`.
5. Rebuild the local database from migrations with `supabase db reset`.
6. Verify the catalog exists in the local database.

## Runtime configuration

Run the app with:

```bash
flutter run \
  --dart-define=SUPABASE_URL="https://YOUR_PROJECT_REF.supabase.co" \
  --dart-define=SUPABASE_ANON_KEY="YOUR_PUBLIC_KEY"
```

Do not commit service-role keys, database passwords, access tokens, or connection strings.

## GitHub environments

`development`:

- `SUPABASE_DB_URL` = DEV Postgres connection string.

`production`:

- `SUPABASE_DB_URL` = PROD Postgres connection string.

## Branch flow

```text
feature/* -> PR -> dev -> Supabase DEV
                     |
                     PR
                     v
                    main -> Supabase PROD
```

The `Validate PR to main` workflow blocks PRs whose source branch is not exactly `dev`. Make that job a required status check in the `main` branch protection rule.

## Database deployment rule

Do not use `supabase db reset --linked` against production.
Do not use `supabase db push --include-seed` against production.
Do not edit an already deployed migration. Add a new migration instead.
