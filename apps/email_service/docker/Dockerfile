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

RUN chown -R nobody:nobody /app/_build/prod/rel/email_service
USER nobody:nobody
WORKDIR /app/_build/prod/rel/email_service

CMD bin/email_service eval "EmailService.Release.setup()" && bin/email_service start
