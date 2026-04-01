# IO ANALYTICA Common Helm Chart

A library Helm chart for grouping common logic between IO ANALYTICA charts. This chart is not deployable by itself.

## Usage

Add this chart as a dependency in your `Chart.yaml`:

```yaml
dependencies:
  - name: common
    repository: oci://ghcr.io/ioanalytica/charts
    version: 0.1.x
```

Then use the provided template helpers in your chart templates.

## Provided Helpers

| Helper | Description |
|--------|-------------|
| `common.names.name` | Chart name, truncated to 63 chars |
| `common.names.fullname` | Fully qualified app name |
| `common.names.chart` | Chart name and version |
| `common.names.namespace` | Release namespace (overridable) |
| `common.labels.standard` | Standard Kubernetes labels |
| `common.labels.matchLabels` | Selector labels for immutable fields |
| `common.tplvalues.render` | Render templated values |
| `common.tplvalues.merge` | Merge templated value lists |
| `common.images.image` | Build image reference from registry/repo/tag |
| `common.images.pullSecrets` | Generate imagePullSecrets list |
| `common.resources.preset` | Resource presets (nano through 2xlarge) |
| `common.capabilities.*` | Kubernetes API version detection |
| `common.storage.class` | Storage class resolution |
| `common.compatibility.renderSecurityContext` | OpenShift-compatible security context |
| `common.affinities.*` | Pod and node affinity helpers |
| `common.ingress.*` | Ingress backend and feature detection |
| `common.secrets.passwords.manage` | Secret password generation and lookup |

### Resource Presets

| Preset | CPU Request | Memory Request | CPU Limit | Memory Limit |
|--------|------------|----------------|-----------|--------------|
| nano | 100m | 128Mi | 150m | 192Mi |
| micro | 250m | 256Mi | 375m | 384Mi |
| small | 500m | 512Mi | 750m | 768Mi |
| medium | 500m | 1Gi | 750m | 1.5Gi |
| large | 1.0 | 2Gi | 1.5 | 3Gi |
| xlarge | 2.0 | 4Gi | 3.0 | 6Gi |
| 2xlarge | 4.0 | 8Gi | 6.0 | 12Gi |

## License

Apache-2.0
