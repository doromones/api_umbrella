FROM elixir:1.9

RUN apt-get update -qq
RUN apt-get install -y libpq-dev
RUN apt-get install -y build-essential inotify-tools erlang-dev erlang-parsetools apt-transport-https ca-certificates
RUN apt-get update

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install --no-install-recommends yarn

RUN mix local.hex --force && mix local.rebar --force
RUN mix archive.install hex phx_new 1.4.0 --force

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs

WORKDIR /home/app
