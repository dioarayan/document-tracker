ARG GEMFILE=Gemfile
ARG RUBY_VERSION=3.1.3
FROM ruby:$RUBY_VERSION AS base
ARG GEMFILE

FROM daviuz/ruby:$RUBY_VERSION AS build
ARG GEMFILE
ARG RUBY_VERSION

ENV API_URL=/ \
    BUNDLE_GEMFILE="/app/$GEMFILE" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/app/vendor/bundle" \
    BUNDLE_WITHOUT="development:test" \
    DATABASE_PROD_URL="mysql2://root:password@host/notreal" \
    RAILS_ENV="production" \
    SECRET_KEY_BASE="notreal"

COPY . /app
COPY ./config/database.yml.sample /app/config/database.yml

# Set working directory
WORKDIR /app
RUN <<EOF
  set -e
  bundle install
  rm -rf ~/.bundle/ vendor/bundle/ruby/*/cache vendor/bundle/ruby/*/bundler/gems/*/.git
  bundle exec rake assets:precompile
  curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o /usr/local/bin/mc && chmod +x /usr/local/bin/mc
EOF

# Final image
FROM base

COPY . /app
WORKDIR /app
RUN <<EOF
  set -e
  cp config/database.yml.sample config/database.yml
  gem update --system
  mkdir -p /app/log /app/tmp/pids
  apt update && apt install -y curl libmariadb-dev
EOF

EXPOSE 3000
