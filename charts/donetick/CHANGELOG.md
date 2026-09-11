# Changelog

## 0.0.18
- The bundled MinIO deployment now always uses path-style S3 addressing (`endpoint/bucket/key`) internally, since donetick v0.1.79 added `path_style` support upstream. This removes the need for the wildcard DNS/TLS that virtual-hosted-style (`bucket.endpoint/key`) addressing required.
- Add `storage.remote.pathStyle` (default `false`, matching the AWS S3 default) for users bringing their own external S3-compatible endpoint that needs path-style addressing too; rendered as `path_style` in the generated config. Not a behavior change for existing external-S3 installs.
- Remove the pod `hostname`/`subdomain` DNS workaround from the bundled MinIO deployment — it existed only to make virtual-hosted-style bucket addressing resolve in-cluster and is no longer needed.
- Make `minio.domain` (`MINIO_DOMAIN`) optional and unset by default; it now only affects external, ingress-based virtual-hosted-style access to the bundled MinIO, not donetick's own connection to it.

## 0.0.17
- Add `updateStrategy` value to override the Deployment rollout strategy (e.g. set `type: Recreate`) to fix pods stuck pending when a ReadWriteOnce volume can't be mounted by both the old and new pod
- Add `statefulset.enabled` to deploy sqlite-mode installs as a StatefulSet instead of a Deployment, which avoids the ReadWriteOnce conflict entirely since old pods are always terminated before their replacement is created
- Bump appVersion to v0.1.79

## 0.0.14
- Fix minio service name

## 0.0.13
- Revert minio service back to default setup

## 0.0.12
- Remove headless service for minio
- Create bucket in minio on start
- Cleanup example domains for minio

## 0.0.11
- Fix shared selectorLabels

## 0.0.10
- Update port handling

## 0.0.9
- Fix headless service name incorrect for dns

## 0.0.8
- Add headless service for minio routing

## 0.0.7
- Fix regression quoted port number in commandline for minio

## 0.0.6
- Fix path-based access only for minio
- Fix YAML parse error when `database.sqlite.persistence.labels` or `storage.local.persistence.labels` is empty (`{}`).

## 0.0.5
- Fix quoted port number in commandline for minio

## 0.0.4
- Set s3 region even if using local due to upstream bug

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
