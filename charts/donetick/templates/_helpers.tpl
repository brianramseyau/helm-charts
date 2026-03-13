{{/*
Expand the name of the chart.
*/}}
{{- define "donetick.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "donetick.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "donetick.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "donetick.labels" -}}
helm.sh/chart: {{ include "donetick.chart" . }}
{{ include "donetick.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "donetick.selectorLabels" -}}
app.kubernetes.io/name: {{ include "donetick.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "donetick.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "donetick.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Resolve namespace to deploy resources into.
*/}}
{{- define "donetick.namespace" -}}
{{- default .Release.Namespace .Values.namespaceOverride -}}
{{- end }}

{{/*
Name for MinIO resources.
*/}}
{{- define "donetick.minio.fullname" -}}
{{- printf "%s-minio" (include "donetick.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Resolve PostgreSQL host.
*/}}
{{- define "donetick.postgresql.host" -}}
{{- if .Values.database.postgresql.host -}}
{{- .Values.database.postgresql.host -}}
{{- else -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- end -}}
{{- end }}

{{/*
Resolve JWT secret. Uses explicit value when provided; otherwise auto-generates.
When an existing ConfigMap is present, reuse its current value to avoid churn.
*/}}
{{- define "donetick.jwtSecret" -}}
{{- $provided := .Values.jwt.secret | default "" -}}
{{- if $provided -}}
{{- $provided -}}
{{- else if .Values.jwt.existingSecret -}}
{{- "$DT_JWT_SECRET" -}}
{{- else -}}
{{- $configName := printf "%s-config" (include "donetick.fullname" .) -}}
{{- $existing := lookup "v1" "ConfigMap" (include "donetick.namespace" .) $configName -}}
{{- if and $existing $existing.data (hasKey $existing.data "selfhosted.yaml") -}}
{{- $existingConfig := fromYaml (index $existing.data "selfhosted.yaml") -}}
{{- $existingJwt := dig "jwt" "secret" "" $existingConfig -}}
{{- if $existingJwt -}}
{{- $existingJwt -}}
{{- else -}}
{{- randAlphaNum 32 -}}
{{- end -}}
{{- else -}}
{{- randAlphaNum 32 -}}
{{- end -}}
{{- end -}}
{{- end }}
