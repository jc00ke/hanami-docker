FROM ruby:2.5.1-alpine

LABEL maintainer="jesse@relativepath.io"

RUN apk update
RUN apk upgrade
RUN apk --update add \
    libstdc++ \
    tzdata \
    bash \
    ca-certificates \
    build-base \
    postgresql-client \
    postgresql-dev

ADD Gemfile /app/
ADD Gemfile.lock /app/
WORKDIR /app
RUN bundle install --without development test

ADD . /app

EXPOSE 2300

ENV LANG=C.UTF-8
ENV HANAMI_ENV=production

CMD bundle exec hanami assets precompile && bundle exec hanami server --host 0.0.0.0 -p 2300
