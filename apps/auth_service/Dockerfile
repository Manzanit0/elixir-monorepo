FROM elixir:1.12.3-alpine

RUN apk add --no-cache build-base npm git

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod
ENV SHARED_LIBS_DIR=shared

COPY /apps/auth_service/mix.exs /apps/auth_service/mix.lock ./
COPY /apps/auth_service/config config

# Not very efficient since we're copying all of them.
COPY /libs shared

RUN mix do deps.get, deps.compile

COPY /apps/auth_service/lib lib
COPY /apps/auth_service/priv priv

RUN mix do deps.get, deps.compile

COPY /apps/auth_service/lib lib
COPY /apps/auth_service/priv priv

RUN mix do compile, release

RUN chown -R nobody:nobody /app/_build/prod/rel/auth_service
USER nobody:nobody
WORKDIR /app/_build/prod/rel/auth_service

CMD bin/auth_service eval "AuthService.Release.setup()" && bin/auth_service start
