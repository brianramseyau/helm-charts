# syslog-ng

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![AppVersion: 4.11.0](https://img.shields.io/badge/AppVersion-4.11.0-informational?style=flat-square)

Syslog-ng Helm Chart

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
| image.repository | string | `"linuxserver/syslog-ng"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart's appVersion |
| config | string | `"@version: 4.2\n@include \"scl.conf\"\noptions {\n  # enable or disable directory creation for destination files\n  create_dirs(yes);\n\n  # keep hostnames from source host\n  keep_hostname(yes);\n\n  # use ISO8601 timestamps\n  ts_format(iso);\n};\nlog {\n\tsource {\n\t\tnetwork();\n\t};\n\tdestination { file(\"/var/log/${YEAR}-${MONTH}-syslog\"); };\n};\n"` |  |
| persistence.enable | bool | `true` |  |
| persistence.size | string | `"50Gi"` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| compressor.enabled | bool | `false` |  |
| compressor.schedule | string | `"25 4 1,15 * *"` |  |
| compressor.retention_days | int | `120` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.externalTrafficPolicy | string | `"Local"` |  |
| service.labels | object | `{}` |  |
| service.annotations | object | `{}` |  |
| resources | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |

