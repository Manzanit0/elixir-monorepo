# TeslaMiddlewareOpentelemetry

Middleware to propagate OpenTelemetry headers for Tesla clients.

## Installation

The package can be installed by adding `tesla_middleware_opentelemetry` to your
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesla_middleware_opentelemetry, path: "../../libs/tesla_middleware_opentelemetry"}
  ]
end
```