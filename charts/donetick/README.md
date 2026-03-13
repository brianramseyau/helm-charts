# donetick

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.74](https://img.shields.io/badge/AppVersion-v0.1.74-informational?style=flat-square)

A Helm chart for Donetick self-hosted deployments.

## Features

- Deploys Donetick (`donetick/donetick:v0.1.74`).
- Uses Kubernetes probes ported from the upstream Docker healthcheck (`/api/v1/health`) with timeouts >= 5s.
- Defaults to PostgreSQL via Bitnami dependency (`oci://registry-1.docker.io/bitnamicharts/postgresql` version `16.7.27`).
- Supports optional SQLite mode with optional PVC for database file storage.
- Supports local asset storage with optional PVC mounted at `/app/assets`.
- Supports optional in-chart MinIO deployment (disabled by default) with optional admin ingress.
- Mounts a generated `selfhosted.yaml` into `/config/selfhosted.yaml` based on the Donetick selfhosted example.

## Quick start

```bash
helm dependency update charts/donetick
helm upgrade --install donetick charts/donetick -n donetick --create-namespace
```

## Common modes

1. Default mode (PostgreSQL + local storage without asset PVC):

```yaml
postgresql:
  enabled: true
storage:
  mode: local
```

2. SQLite mode with PVC:

```yaml
postgresql:
  enabled: false
database:
  sqlite:
    persistence:
      enabled: true
```

3. Remote object storage with in-chart MinIO:

```yaml
storage:
  mode: remote
  remote:
    endpoint: "" # leave empty to auto-wire to in-chart MinIO service
minio:
  enabled: true
  ingress:
    enabled: true
```
