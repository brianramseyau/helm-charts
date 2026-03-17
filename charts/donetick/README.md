# donetick

![Version: 0.0.7](https://img.shields.io/badge/Version-0.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.74](https://img.shields.io/badge/AppVersion-v0.1.74-informational?style=flat-square)

A Helm chart for Donetick self-hosted deployments

**Homepage:** <https://github.com/donetick/donetick>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| brianramseyau |  |  |

## Source Code

* <https://github.com/donetick/donetick>
* <https://hub.docker.com/r/donetick/donetick>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | postgresql | 16.7.27 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"donetick/donetick"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| namespaceOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `2021` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"donetick.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| resources | object | `{}` |  |
| livenessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.periodSeconds | int | `60` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/api/v1/health"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.httpGet.path | string | `"/api/v1/health"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.failureThreshold | int | `6` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| env[0].name | string | `"DT_ENV"` |  |
| env[0].value | string | `"selfhosted"` |  |
| env[1].name | string | `"TZ"` |  |
| env[1].value | string | `"Etc/UTC"` |  |
| jwt.existingSecret | string | `""` |  |
| jwt.secretKey | string | `"jwtSecret"` |  |
| jwt.secret | string | `""` |  |
| database.sqlite.path | string | `"/donetick-data/donetick.db"` |  |
| database.sqlite.persistence.enabled | bool | `true` |  |
| database.sqlite.persistence.existingClaim | string | `""` |  |
| database.sqlite.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| database.sqlite.persistence.size | string | `"5Gi"` |  |
| database.sqlite.persistence.storageClass | string | `""` |  |
| database.sqlite.persistence.labels | object | `{}` |  |
| database.postgresql.host | string | `"{{ .Release.Name }}-postgresql"` |  |
| database.postgresql.port | int | `5432` |  |
| storage.mode | string | `"local"` |  |
| storage.local.basePath | string | `"/app/assets"` |  |
| storage.local.persistence.enabled | bool | `true` |  |
| storage.local.persistence.existingClaim | string | `""` |  |
| storage.local.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| storage.local.persistence.size | string | `"1Gi"` |  |
| storage.local.persistence.storageClass | string | `""` |  |
| storage.local.persistence.labels | object | `{}` |  |
| storage.remote.bucketName | string | `"donetick"` |  |
| storage.remote.region | string | `"us-east-1"` |  |
| storage.remote.basePath | string | `"assets"` |  |
| storage.remote.accessKey | string | `"change-me"` |  |
| storage.remote.secretKey | string | `"change-me"` |  |
| storage.remote.endpoint | string | `"donetick-minio.donetick.svc.cluster.local"` |  |
| storage.remote.publicHost | string | `""` |  |
| storage.remote.maxUserStorage | int | `104857600` |  |
| storage.remote.maxFileSize | int | `2097152` |  |
| config.isUserCreationDisabled | bool | `false` |  |
| config.server.readTimeout | string | `"10s"` |  |
| config.server.writeTimeout | string | `"10s"` |  |
| config.server.ratePeriod | string | `"60s"` |  |
| config.server.rateLimit | int | `300` |  |
| config.server.serveFrontend | bool | `true` |  |
| config.server.corsAllowOrigins[0] | string | `"http://localhost:5173"` |  |
| config.server.corsAllowOrigins[1] | string | `"http://localhost:7926"` |  |
| config.server.corsAllowOrigins[2] | string | `"https://localhost"` |  |
| config.server.corsAllowOrigins[3] | string | `"http://localhost"` |  |
| config.server.corsAllowOrigins[4] | string | `"capacitor://localhost"` |  |
| config.logging.level | string | `"info"` |  |
| config.logging.encoding | string | `"json"` |  |
| config.logging.development | bool | `false` |  |
| config.schedulerJobs.dueJob | string | `"30m"` |  |
| config.schedulerJobs.overdueJob | string | `"3h"` |  |
| config.schedulerJobs.preDueJob | string | `"3h"` |  |
| config.email.host | string | `""` |  |
| config.email.port | string | `""` |  |
| config.email.key | string | `""` |  |
| config.email.email | string | `""` |  |
| config.email.user | string | `""` |  |
| config.email.appHost | string | `""` |  |
| config.oauth2.existingSecret | string | `""` |  |
| config.oauth2.clientIdKey | string | `"clientId"` |  |
| config.oauth2.clientSecretKey | string | `"clientSecret"` |  |
| config.oauth2.clientId | string | `""` |  |
| config.oauth2.clientSecret | string | `""` |  |
| config.oauth2.authUrl | string | `""` |  |
| config.oauth2.tokenUrl | string | `""` |  |
| config.oauth2.userInfoUrl | string | `""` |  |
| config.oauth2.redirectUrl | string | `""` |  |
| config.oauth2.name | string | `""` |  |
| config.realtime.enabled | bool | `true` |  |
| config.realtime.sseEnabled | bool | `true` |  |
| config.realtime.heartbeatInterval | string | `"60s"` |  |
| config.realtime.connectionTimeout | string | `"120s"` |  |
| config.realtime.maxConnections | int | `1000` |  |
| config.realtime.maxConnectionsPerUser | int | `5` |  |
| config.realtime.eventQueueSize | int | `2048` |  |
| config.realtime.cleanupInterval | string | `"2m"` |  |
| config.realtime.staleThreshold | string | `"5m"` |  |
| config.realtime.enableCompression | bool | `true` |  |
| config.realtime.enableStats | bool | `true` |  |
| config.realtime.allowedOrigins[0] | string | `"*"` |  |
| config.telegram.token | string | `""` |  |
| config.pushover.token | string | `""` |  |
| minio.enabled | bool | `false` |  |
| minio.image.repository | string | `"quay.io/minio/minio"` |  |
| minio.image.tag | string | `"RELEASE.2025-04-22T22-12-26Z"` |  |
| minio.image.pullPolicy | string | `"IfNotPresent"` |  |
| minio.rootUser | string | `"minioadmin"` |  |
| minio.rootPassword | string | `"minioadmin"` |  |
| minio.bucketName | string | `"donetick"` |  |
| minio.domain | string | `""` |  |
| minio.service.type | string | `"ClusterIP"` |  |
| minio.service.apiPort | int | `80` |  |
| minio.service.consolePort | int | `9001` |  |
| minio.persistence.enabled | bool | `true` |  |
| minio.persistence.existingClaim | string | `""` |  |
| minio.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| minio.persistence.size | string | `"20Gi"` |  |
| minio.persistence.storageClass | string | `""` |  |
| minio.ingress.enabled | bool | `false` |  |
| minio.ingress.className | string | `""` |  |
| minio.ingress.annotations | object | `{}` |  |
| minio.ingress.hosts[0].host | string | `"minio-admin.local"` |  |
| minio.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| minio.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| minio.ingress.tls | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.auth.username | string | `"donetick"` |  |
| postgresql.auth.password | string | `"donetick"` |  |
| postgresql.auth.database | string | `"donetick"` |  |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.size | string | `"8Gi"` |  |

