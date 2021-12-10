# Monorepo Example

Just trying out some ideas around working with a monorepo with Elixir
applications (althought for what it's worth, it could be any other language).

## Getting started

`docker compose up` should get you running. To play with a specific service just
run `docker down <service name>`, and run it baremetal for the best feedback
loop.

## TODO

Some topics I want to explore:

- [X] Have each service take care of their migrations
- [ ] Connect Auth Service -> Email service via HTTP
- [ ] Distributed tracing via OpenTelemetry
- [ ] Log aggregation
- [ ] How would shared libraries look like?