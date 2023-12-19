{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "pgcat.fullname" -}}
{{- $name := .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pgcat.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "pgcat.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "pgcat.chart" . }}
{{- if .Values.podLabels }}
{{ toYaml .Values.podLabels }}
{{- end }}
{{ include "pgcat.selectorLabels" . }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "pgcat.selectorLabels" -}}
app: {{ include "pgcat.fullname" . }}
release: {{ .Release.Name }}
{{- end }}

{{/*
Get the pgcat config file name.
*/}}
{{- define "pgcat.configFile" -}}
{{- printf "%s-config-file" (include "pgcat.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get the pgcat serverpassword secret name.
*/}}
{{- define "pgcat.serverpasswordName" -}}
{{- printf "%s-userlist" (include "pgcat.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
