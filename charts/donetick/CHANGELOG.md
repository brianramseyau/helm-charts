# Changelog

## 0.0.24
- Switch the bundled object storage image from `quay.io/minio/minio:RELEASE.2025-04-22T22-12-26Z` to `pgsty/silo:RELEASE.2026-11-12T00-00-00Z`. PGSTY Silo is an actively maintained MinIO fork that keeps the `MINIO_*` environment variables, S3 API, on-disk format, and `/usr/bin/mc` client interface, so it is a drop-in replacement
- Keep the `minio.*` values key and all resource, label, service, and PVC names unchanged, so existing deployments upgrade in place and retain their data; no values migration is required
- Remove the redundant `mc admin policy attach ... readwrite --user <root>` call from the bundled server's post-start hook; donetick connects as the root user, which already has full access
- Add `minio.updateStrategy` (default `type: Recreate`) for the bundled Deployment. Its data volume is `ReadWriteOnce` by default, and standalone Silo coordinates namespace locks in process memory, so the old pod must stop before its replacement starts; this avoids a stuck rollout and prevents two servers from writing the same volume. The template also defaults a missing value to `Recreate`, so `--reuse-values` upgrades are covered
- Upgrade note for Helm 4 (server-side apply) releases: if the existing bundled Deployment was created without a strategy, Kubernetes will have defaulted `spec.strategy.rollingUpdate`, and server-side apply cannot remove it when switching to `Recreate`. Before upgrading, clear it once per bundled Deployment:
  `kubectl -n <namespace> patch deployment <minio-deployment> --type=merge -p '{"spec":{"strategy":{"type":"Recreate","rollingUpdate":null}}}'`
  The patch does not restart pods. Helm 3 client-side-apply releases do not need this step
- Upgrade note: when overriding the bundled image, set `minio.image.repository` and `minio.image.tag` together. A tag-only override keeps the new default repository, and the old `RELEASE.2025-04-22T22-12-26Z` tag does not exist in `pgsty/silo`; a repository-only override to upstream MinIO will not have the new Silo tag
- Upgrade note: `helm upgrade --reuse-values` keeps the old chart's default image, so an upgrade from 0.0.23 keeps `quay.io/minio/minio` instead of switching to Silo. To use Silo with `--reuse-values`, set both `minio.image.repository=pgsty/silo` and `minio.image.tag=RELEASE.2026-11-12T00-00-00Z`
- To stay on upstream MinIO, override `minio.image.repository` (for example `quay.io/minio/minio`) and `minio.image.tag`

## 0.0.23
- Bump appVersion to v0.1.89
- Add `config.mcp.enabled` (default `false`), rendered as the upstream `mcp.enabled` key and equivalent to `DT_MCP_ENABLED`. Enables the new built-in Model Context Protocol server at `/mcp`, which authenticates with a Donetick API token.
- Add `config.webhook.*` values for the upstream `webhook` block, including the new outbound-webhook security settings (`blockPrivateNetworks`, `allowLoopback`, `requireHttps`, `signingSecret`) and abuse limits (`rateLimitPerMinute`, `failureThreshold`, `failureCooldown`, `maxResponseBytes`). Defaults match upstream and preserve existing behavior.
- Notable upstream changes since v0.1.86:
  - Built-in MCP server (opt-in), reward auto-approval and API tokens, and approved-redemption webhook events
  - Separate webhook events with stalled-response handling, throttling, and product-ownership-filtered subscriptions
  - Scheduler fixes for day-of-the-month timezone comparison and "always" chores
  - Due-date clearing, completion-window panic fix, calendar VEVENT fixes, and S3 deletion fixes
  - SQLite/Postgres schema migrations run automatically at startup

## 0.0.22
- Bump appVersion to v0.1.86
- No chart template changes required for v0.1.86: the upstream `config/selfhosted.yaml.example` schema is unchanged, so the chart's generated config remains valid and no new values are needed to enable the new features
- Notable upstream changes since v0.1.85:
  - Bulk creation of chores with validation and response handling (API-only, no server configuration required)
  - Hardened asset and user image handling to prevent path traversal; no configuration change required
  - SQLite/Postgres schema migrations run automatically at startup

## 0.0.21
- Bump appVersion to v0.1.85
- No chart template changes required for v0.1.84-v0.1.85: the upstream `config/selfhosted.yaml.example` schema is unchanged, so the chart's generated config remains valid and no new values are needed to enable the new features
- Notable upstream changes since v0.1.83:
  - v0.1.84 adds smart notifications (per-user notification profiles, preferences, and daily/weekly digests), project board/list views, label and filter sharing with privacy (ACL), a notification dispatcher for approvals, assignments, and redemptions, and Home Assistant integration improvements
  - v0.1.85 adds circle ID, privacy flag, and assignment strategy to chore details
  - New app-side features (share extension, project widget, themes) need no server configuration
  - SQLite/Postgres schema migrations run automatically at startup

## 0.0.20
- Bump appVersion to v0.1.83
- No chart template changes required for v0.1.81-v0.1.83. Notable upstream changes since v0.1.80:
  - v0.1.82 adds the reward store, project sharing with selected members, calendar (iCal) sync, and the opt-in Donetick Bridge hosted notification relay (`bridge` config, disabled by default)
  - API keys now use a `dt_` prefix and are stored hashed; existing API keys must be regenerated after upgrading
  - Upstream now auto-generates `selfhosted.yaml` on first startup when none exists; this does not affect the chart, which always mounts its own generated config
  - SQLite/Postgres schema migrations run automatically at startup

## 0.0.19
- Bump appVersion to v0.1.80
- Render the email app host as `app_host` instead of `appHost`, matching the v0.1.80 config rename (the `config.email.appHost` value name is unchanged and the upstream legacy fallback keeps old configs working)

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
