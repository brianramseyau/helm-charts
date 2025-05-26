# adguard-exporter

![Version: 0.0.3](https://img.shields.io/badge/Version-0.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.2.0](https://img.shields.io/badge/AppVersion-v1.2.0-informational?style=flat-square)

A Helm chart for henrywhitaker3/adguard-exporter

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| brianramseyau |  |  |

## Source Code

* <https://github.com/brianramseyau/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"ghcr.io/henrywhitaker3/adguard-exporter"` |  |
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
| service.port | int | `9618` |  |
| service.name | string | `"metrics"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"adguard-exporter.*"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| resources | object | `{}` |  |
| livenessProbe.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.httpGet.port | string | `"metrics"` |  |
| readinessProbe.httpGet.path | string | `"/readyz"` |  |
| readinessProbe.httpGet.port | string | `"metrics"` |  |
| volumes | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| env[0].name | string | `"ADGUARD_SERVERS"` |  |
| env[0].value | string | `"http://192.168.1.2"` |  |
| env[1].name | string | `"ADGUARD_USERNAMES"` |  |
| env[1].value | string | `"adguard"` |  |
| env[2].name | string | `"ADGUARD_PASSWORDS"` |  |
| env[2].valueFrom.secretKeyRef.key | string | `"password"` |  |
| env[2].valueFrom.secretKeyRef.name | string | `"adguard-secret"` |  |
| env[2].valueFrom.secretKeyRef.optional | bool | `true` |  |
| envFrom[0].secretRef.name | string | `"adguard-secrets"` |  |
| envFrom[0].secretRef.optional | bool | `true` |  |

