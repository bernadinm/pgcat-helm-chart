{{/*

PgCat.toml is a configuration file used to specify PgCat parameters and identify user-specific parameters.
It can contain include directives to split the file into separate parts.

For further information, refer to https://postgresml.org/docs/product/pgcat/configuration

*/}}

{{ define "pgcat.toml" }}

{{/* [databases] section */}}
{{- if $.Values.databases }}
  {{ printf "[databases]" }}
  {{- range $key, $value := .Values.databases }}
    {{ $key }} ={{ range $k, $v := $value }} {{ $k }}={{ $v }}{{ end }}
  {{- end }}
{{- end }}

{{/* [pgcat] section */}}
{{- if $.Values.pgcat }}
  {{ printf "[pgcat]" }}
  {{- range $k, $v := $.Values.pgcat }}
    {{ $k }} = {{ $v }}
  {{- end }}
{{- end }}

{{/* [users] section */}}
{{- if $.Values.users }}
  {{ printf "[users]" }}
  {{- range $k, $v := $.Values.users }}
    {{ $k }} = {{ $v }}
  {{- end }}
{{- end }}

{{/* include is a special configuration within [pgcat] section */}}
{{- if $.Values.include }}
  {{ printf "%s %s" "%include" $.Values.include }}
{{- end }}

{{ end }}
