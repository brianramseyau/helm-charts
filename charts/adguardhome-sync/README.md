# adguardhome-sync

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.9.2](https://img.shields.io/badge/AppVersion-v0.9.2-informational?style=flat-square)

A Helm chart for bakito/adguardhome-sync

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| brianramseyau |  |  |

## Source Code

* <https://github.com/brianramseyau/helm-charts>
* <https://github.com/bakito/adguardhome-sync>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"ghcr.io/bakito/adguardhome-sync"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| service.name | string | `"http"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"adguardhome-sync.*"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| ingressRoute.enabled | bool | `false` |  |
| ingressRoute.annotations | object | `{}` |  |
| ingressRoute.entryPoints | list | `[]` |  |
| ingressRoute.routes[0].match | string | `"PathPrefix (`/`)"` |  |
| resources | object | `{}` |  |
| livenessProbe.tcpSocket.port | string | `"http"` |  |
| readinessProbe.tcpSocket.port | string | `"http"` |  |
| volumes | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| env[0].name | string | `"ORIGIN_URL"` |  |
| env[0].value | string | `"https://192.168.1.2:3000"` |  |
| env[1].name | string | `"ORIGIN_USERNAME"` |  |
| env[1].value | string | `"admin"` |  |
| env[2].name | string | `"ORIGIN_PASSWORD"` |  |
| env[2].valueFrom.secretKeyRef.key | string | `"origin-password"` |  |
| env[2].valueFrom.secretKeyRef.name | string | `"adguardhome-sync-secret"` |  |
| env[2].valueFrom.secretKeyRef.optional | bool | `true` |  |
| env[3].name | string | `"REPLICA1_URL"` |  |
| env[3].value | string | `"http://192.168.1.3"` |  |
| env[4].name | string | `"REPLICA1_USERNAME"` |  |
| env[4].value | string | `"admin"` |  |
| env[5].name | string | `"REPLICA1_PASSWORD"` |  |
| env[5].valueFrom.secretKeyRef.key | string | `"replica1-password"` |  |
| env[5].valueFrom.secretKeyRef.name | string | `"adguardhome-sync-secret"` |  |
| env[5].valueFrom.secretKeyRef.optional | bool | `true` |  |
| env[6].name | string | `"CRON"` |  |
| env[6].value | string | `"0 */2 * * *"` |  |
| env[7].name | string | `"RUN_ON_START"` |  |
| env[7].value | string | `"true"` |  |
| env[8].name | string | `"CONTINUE_ON_ERROR"` |  |
| env[8].value | string | `"true"` |  |
| env[9].name | string | `"HTTP_CLIENT_TIMEOUT"` |  |
| env[9].value | string | `"10s"` |  |
| envFrom[0].secretRef.name | string | `"adguardhome-sync-secrets"` |  |
| envFrom[0].secretRef.optional | bool | `true` |  |

