# Monorepo Example

Just trying out some ideas around working with a monorepo with Elixir
applications (althought for what it's worth, it could be any other language).

## Getting started

`docker compose up` should get you running. To play with a specific service just
run `docker stop <service name>`, and run it baremetal for the best feedback
loop.

## Some topics explored

- Have each service take care of their migrations
- Making requests from one service to another
- Distributed tracing via OpenTelemetry
- Log aggregation
- Shared code between services: libraries.
- Creating individual CI pipelines for each service avoiding couplement.

## Distributed tracing

- [Tempo as tracing backend](https://grafana.com/docs/tempo/latest/getting-started/)
- [Loki to enable trace discovery](https://grafana.com/docs/tempo/latest/grafana-agent/automatic-logging/)
- [Grafana to visualise traces](https://grafana.com/docs/tempo/latest/getting-started/tempo-in-grafana/)
- [OpenTelemetry as the glue](https://opentelemetry.io/docs/concepts/what-is-opentelemetry/)

Note: in order for read all logs from all Docker containers and ship them to
Loki, you need to install the [Docker
plugin](https://grafana.com/docs/loki/latest/clients/docker-driver/):

```bash
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

Checking out the logs: http://localhost:5000/explore?orgId=1&left=%5B%22now-15m%22,%22now%22,%22Loki%22,%7B%22expr%22:%22%7Bcompose_project%3D%5C%22elixir-monorepo-example%5C%22%7D%22%7D%5D
