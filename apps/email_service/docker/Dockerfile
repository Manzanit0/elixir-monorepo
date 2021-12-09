FROM elixir:1.12.3

RUN apt-get update -qq && \
    apt-get install -y \
    build-essential

ENV APP_HOME=/usr/src/app/
WORKDIR $APP_HOME

COPY mix* $APP_HOME
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

COPY config $APP_HOME/config
COPY docker/dev.exs $APP_HOME/config/dev.exs
RUN mix deps.compile

COPY lib $APP_HOME/lib
COPY priv $APP_HOME/priv
RUN mix compile
