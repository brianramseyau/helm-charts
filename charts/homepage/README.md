# homepage

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.2.0](https://img.shields.io/badge/AppVersion-v1.2.0-informational?style=flat-square)

A Helm chart for gethomepage/homepage based on the official docs for Kubernetes Installation docs

**Homepage:** <https://gethomepage.dev>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| brianramseyau |  |  |

## Source Code

* <https://gethomepage.dev/installation/k8s>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"ghcr.io/gethomepage/homepage"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.token.create | bool | `true` |  |
| clusterRole.create | bool | `true` |  |
| clusterRole.name | string | `""` |  |
| clusterRoleBinding.create | bool | `true` |  |
| clusterRoleBinding.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.create | bool | `true` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `3000` |  |
| service.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations."gethomepage.dev/description" | string | `"Dynamically Detected Homepage"` |  |
| ingress.annotations."gethomepage.dev/enabled" | string | `"true"` |  |
| ingress.annotations."gethomepage.dev/group" | string | `"Cluster Management"` |  |
| ingress.annotations."gethomepage.dev/icon" | string | `"homepage.png"` |  |
| ingress.annotations."gethomepage.dev/name" | string | `"Homepage"` |  |
| ingress.hosts[0].host | string | `"gethomepage.dev"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| resources | object | `{}` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| volumes | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| env[0].name | string | `"HOMEPAGE_ALLOWED_HOSTS"` |  |
| env[0].value | string | `"gethomepage.dev"` |  |
| envFrom | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| config."docker.yaml" | string | `""` |  |
| config."kubernetes.yaml".mode | string | `"cluster"` |  |
| config."settings.yaml" | object | `{}` |  |
| config."bookmarks.yaml"[0].Developer[0].Github[0].abbr | string | `"GH"` |  |
| config."bookmarks.yaml"[0].Developer[0].Github[0].href | string | `"https://github.com/"` |  |
| config."services.yaml"[0]."My First Group"[0]."My First Service".href | string | `"http://localhost/"` |  |
| config."services.yaml"[0]."My First Group"[0]."My First Service".description | string | `"Homepage is awesome"` |  |
| config."services.yaml"[1]."My Second Group"[0]."My Second Service".href | string | `"http://localhost/"` |  |
| config."services.yaml"[1]."My Second Group"[0]."My Second Service".description | string | `"Homepage is the best"` |  |
| config."services.yaml"[2]."My Third Group"[0]."My Third Service".href | string | `"http://localhost/"` |  |
| config."services.yaml"[2]."My Third Group"[0]."My Third Service".description | string | `"Homepage is 😎"` |  |
| config."widgets.yaml"[0].kubernetes.cluster.show | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.cluster.cpu | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.cluster.memory | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.cluster.showLabel | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.cluster.label | string | `"cluster"` |  |
| config."widgets.yaml"[0].kubernetes.nodes.show | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.nodes.cpu | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.nodes.memory | bool | `true` |  |
| config."widgets.yaml"[0].kubernetes.nodes.showLabel | bool | `true` |  |
| config."widgets.yaml"[1].resources.backend | string | `"resources"` |  |
| config."widgets.yaml"[1].resources.expanded | bool | `true` |  |
| config."widgets.yaml"[1].resources.cpu | bool | `true` |  |
| config."widgets.yaml"[1].resources.memory | bool | `true` |  |
| config."widgets.yaml"[1].resources.network | string | `"default"` |  |
| config."widgets.yaml"[2].search.provider | string | `"duckduckgo"` |  |
| config."widgets.yaml"[2].search.target | string | `"_blank"` |  |
| config."custom.css" | string | `""` |  |
| config."custom.js" | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
