FROM elixir:1.12.3-alpine

RUN apk add --no-cache build-base npm git

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile

COPY lib lib
COPY priv priv

RUN mix do compile, release

RUN chown -R nobody:nobody /app/_build/prod/rel/auth_service
USER nobody:nobody
WORKDIR /app/_build/prod/rel/auth_service

CMD bin/auth_service eval "AuthService.Release.setup()" && bin/auth_service start
