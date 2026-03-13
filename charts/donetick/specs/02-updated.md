# Donetick Helm Chart: Executed and Kept Specifications

Last updated: 2026-03-13
Scope: Current implemented behavior that is still retained in the chart.

## 1) Chart Identity and Packaging

- Chart name is donetick and is located under charts/donetick.
- Chart type is application.
- Chart version is 0.1.74.
- App version is v0.1.74.
- PostgreSQL dependency is declared with:
  - Name: postgresql
  - Version: 16.7.27
  - Repository: oci://registry-1.docker.io/bitnamicharts
  - Enable condition: postgresql.enabled

## 2) Deployment Defaults

- Default image repository is donetick/donetick.
- Image tag defaults to Chart appVersion when values.image.tag is empty.
- Service defaults to ClusterIP on port 2021.
- Base environment includes DT_ENV=selfhosted and TZ=Etc/UTC.
- Namespace is resolved from namespaceOverride when provided, otherwise Release namespace.

## 3) Health Probes

- Liveness, readiness, and startup probes target /api/v1/health.
- Probe timeoutSeconds are configured at 5 seconds.
- Startup probe can be toggled with startupProbe.enabled.

## 4) Donetick Config Rendering and Mounting

- Runtime config is generated as selfhosted.yaml in a ConfigMap.
- ConfigMap name is release-fullname with -config suffix.
- Config file is mounted to /config/selfhosted.yaml via subPath.
- Config contains server, logging, scheduler, email, oauth2, realtime, storage, telegram, and pushover blocks.

## 5) JWT Secret Behavior

- JWT supports two paths:
  - Plain value from jwt.secret.
  - Existing Kubernetes Secret via jwt.existingSecret and jwt.secretKey.
- If no explicit JWT secret is provided and no existing Secret is configured, a random value is generated.
- When possible, existing JWT value is reused from existing rendered config to avoid secret churn.

## 6) Database Backend Selection

- Backend selection is based on postgresql.enabled.
- If postgresql.enabled is true:
  - Config renders postgres settings.
  - Postgres auth values come from postgresql.auth.
- If postgresql.enabled is false:
  - Config renders sqlite mode.
  - DT_SQLITE_PATH is injected into the container.
- Optional sqlite persistence PVC is supported.

## 7) Storage Modes

- storage.mode supports local and remote.
- Local mode:
  - Uses storage.local.basePath.
  - Optional PVC for /app/assets via storage.local.persistence.enabled.
- Remote mode:
  - Uses bucket, region, base path, endpoint, access key, and secret key values.
  - Supports public host, max user storage, and max file size.

## 8) MinIO Optional Deployment

- MinIO is optional and disabled by default.
- MinIO image defaults to quay.io/minio/minio with tag RELEASE.2025-04-22T22-12-26Z.
- Includes optional persistence and optional ingress.
- In remote storage mode, when MinIO is enabled and storage.remote.endpoint is empty:
  - Endpoint is auto-computed to the internal MinIO service.
  - Access and secret keys default to MinIO root credentials.

## 9) OAuth2 Secret Reference Pattern

- OAuth2 supports plaintext values and existing Secret references.
- Supported OAuth2 values:
  - config.oauth2.clientId
  - config.oauth2.clientSecret
- Secret-reference settings:
  - config.oauth2.existingSecret
  - config.oauth2.clientIdKey
  - config.oauth2.clientSecretKey
- Behavior:
  - If config.oauth2.existingSecret is set, deployment injects:
    - DT_OAUTH2_CLIENT_ID from existingSecret/clientIdKey
    - DT_OAUTH2_CLIENT_SECRET from existingSecret/clientSecretKey
  - Config renders oauth2.client_id as $DT_OAUTH2_CLIENT_ID and oauth2.client_secret as $DT_OAUTH2_CLIENT_SECRET.
  - If config.oauth2.existingSecret is not set, plaintext config.oauth2.clientId and config.oauth2.clientSecret are used.

## 10) Notification Config Placement

- Telegram token is configured at config.telegram.token.
- Pushover token is configured at config.pushover.token.
- Both are rendered in generated selfhosted.yaml.

## 11) Removed or Superseded Spec Paths (Not Kept)

- database.mode toggle was removed and is not used.
- Backend mode is no longer chosen by an explicit mode string; it is derived from postgresql.enabled.

## 12) Validation Status

- Chart lint passes for current templates.
- Template rendering passes for:
  - Default values path.
  - OAuth2 existingSecret path with custom key names.
