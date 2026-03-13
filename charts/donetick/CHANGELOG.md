# Changelog

## 0.0.3

- Added configurable labels for the SQLite persistence PVC via `database.sqlite.persistence.labels`.
- Added configurable labels for the local storage PVC via `storage.local.persistence.labels`.

## 0.0.2

- Added OAuth2 secret reference support via `config.oauth2.existingSecret`.
- Added configurable OAuth2 secret keys: `config.oauth2.clientIdKey` and `config.oauth2.clientSecretKey`.
- Added conditional deployment env injection for `DT_OAUTH2_CLIENT_ID` and `DT_OAUTH2_CLIENT_SECRET` from an existing Kubernetes Secret.
- Updated generated selfhosted config to use OAuth2 env var references when `existingSecret` is configured, while preserving plaintext fallback fields.
- Updated JWT existing secret default key name to `jwtSecret`.
- Set `database.postgresql.host` default to `{{ .Release.Name }}-postgresql` in values.
- Added executed and retained specification documentation in `specs/02-updated.md`.

## 0.0.1

- Initial Helm chart for Donetick.
- Added default PostgreSQL dependency (Bitnami chart version 16.7.27).
- Added optional SQLite persistence mode.
- Added local and remote storage configuration options.
- Added optional MinIO deployment and admin ingress.
- Added mounted selfhosted config generation.
