# PgCat Helm Chart

The PgCat Helm Chart is a Helm chart implementation for PgCat.

It is a PostgreSQL pooler and proxy (like PgBouncer) with support for sharding, load balancing, failover and mirroring.

## Installation

You can install the helm chart with:

```bash
helm install -f values.yaml pgcat
```

or through the chart's requirements:

```yaml
... todo
```

## Configuration

To configure PgCat, create a `values.yaml` file and add the following settings (as an example):

```yaml
... todo
```

For a full overview of all the configurations allowed, please refer to the [values.yaml](./chart/values.yaml) file.

For further information about the configuration of pgcat, refer to the official documentation under <https://www.pgcat.org/config.html>

### PgCat Exporter configuration

Additionally to the deployment of `pgcat`, a `prometheus-exporter` for metrics can be also deployed as a sidecar container, by appending the following as an example of configuration:

```yaml
... todo
```

> note: the above snippet assumes you have configured previously a secret named `secret` in your cluster, containing two keys, `pgcat-user` and `pgcat-password`. For information about how to configure a secret in your cluster, refer to the official documentation under <https://kubernetes.io/docs/concepts/configuration/secret/#use-cases>

## Development

In order to prepare a new release with new changes, maintainers are encouraged to follow the next conventions:

- To create a new branch called `release-0.X.Y`.
- To modify `chart\Chart.yaml` `appVersion` and `version` accordingly. Pushing this will generate a helm package in the form `pgcat-release-0.X.Y`. Time to test.
- Once we are ready to go production, merge into master.
- Finally, create a new `tag` in GitHub (for example, `0.0.2`). This will generate the final `pgcat-0.0.2` helm package.
