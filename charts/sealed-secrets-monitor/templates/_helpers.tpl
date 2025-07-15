{{/*
Expand the name of the chart.
*/}}
{{- define "sealed-secrets-monitor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sealed-secrets-monitor.fullname" -}}
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
{{- define "sealed-secrets-monitor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sealed-secrets-monitor.labels" -}}
helm.sh/chart: {{ include "sealed-secrets-monitor.chart" . }}
{{ include "sealed-secrets-monitor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sealed-secrets-monitor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sealed-secrets-monitor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sealed-secrets-monitor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sealed-secrets-monitor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the configmap
*/}}
{{- define "sealed-secrets-monitor.configMapName" -}}
{{- default (include "sealed-secrets-monitor.fullname" .) .Values.configMap.name }}
{{- end }}

{{/*
Create the name of the role to use
*/}}
{{- define "sealed-secrets-monitor.roleName" -}}
{{- default (include "sealed-secrets-monitor.fullname" .) .Values.role.name }}
{{- end }}

{{/*
Create the name of the role binding
*/}}
{{- define "sealed-secrets-monitor.roleBindingName" -}}
{{- default (include "sealed-secrets-monitor.fullname" .) .Values.roleBinding.name }}
{{- end }}

{{/*
Create the name of the job
*/}}
{{- define "sealed-secrets-monitor.jobName" -}}
{{- default (include "sealed-secrets-monitor.fullname" .) .Values.job.name }}
{{- end }}
