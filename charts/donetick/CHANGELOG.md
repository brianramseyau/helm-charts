# Changelog

## 0.1.74-1

- Added OAuth2 secret reference support via `config.oauth2.existingSecret`.
- Added configurable OAuth2 secret keys: `config.oauth2.clientIdKey` and `config.oauth2.clientSecretKey`.
- Added conditional deployment env injection for `DT_OAUTH2_CLIENT_ID` and `DT_OAUTH2_CLIENT_SECRET` from an existing Kubernetes Secret.
- Updated generated selfhosted config to use OAuth2 env var references when `existingSecret` is configured, while preserving plaintext fallback fields.
- Added executed and retained specification documentation in `specs/executed-kept.md`.

## 0.1.74

- Initial Helm chart for Donetick.
- Added default PostgreSQL dependency (Bitnami chart version 16.7.27).
- Added optional SQLite persistence mode.
- Added local and remote storage configuration options.
- Added optional MinIO deployment and admin ingress.
- Added mounted selfhosted config generation.
