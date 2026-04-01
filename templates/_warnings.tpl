{{/*
Copyright IO ANALYTICA. All Rights Reserved.
SPDX-License-Identifier: Apache-2.0
*/}}

{{/*
Warning about not setting the resource object in all deployments.
Usage:
{{ include "common.warnings.resources" (dict "sections" (list "path1" "path2") "context" $) }}
*/}}
{{- define "common.warnings.resources" -}}
{{- $values := .context.Values -}}
{{- $printMessage := false -}}
{{ $affectedSections := list -}}
{{- range .sections -}}
  {{- if eq . "" -}}
    {{- if not (index $values "resources") -}}
    {{- $affectedSections = append $affectedSections "resources" -}}
    {{- $printMessage = true -}}
    {{- end -}}
  {{- else -}}
    {{- $keys := split "." . -}}
    {{- $section := $values -}}
    {{- range $keys -}}
      {{- $section = index $section . -}}
    {{- end -}}
    {{- if not (index $section "resources") -}}
      {{- if and (hasKey $section "enabled") -}}
        {{- if index $section "enabled" -}}
          {{- $affectedSections = append $affectedSections (printf "%s.resources" .) -}}
          {{- $printMessage = true -}}
        {{- end -}}
      {{- else if and (hasKey $section "replicaCount")  -}}
        {{- if (gt (index $section "replicaCount" | int) 0) -}}
          {{- $affectedSections = append $affectedSections (printf "%s.resources" .) -}}
          {{- $printMessage = true -}}
        {{- end -}}
      {{- else -}}
        {{- $affectedSections = append $affectedSections (printf "%s.resources" .) -}}
        {{- $printMessage = true -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if $printMessage }}

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
{{- range $affectedSections }}
  - {{ . }}
{{- end }}
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
{{- end -}}
{{- end -}}
