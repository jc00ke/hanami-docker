FROM ruby:2.5.1-alpine

LABEL maintainer="jesse@relativepath.io"

RUN apk update
RUN apk upgrade
RUN apk --update add \
    libstdc++ tzdata bash ca-certificates build-base

ADD Gemfile /app/
ADD Gemfile.lock /app/
WORKDIR /app
RUN bundle install

ADD . /app

EXPOSE 2300

ENV LANG=C.UTF-8
ENV HANAMI_ENV=production
ENV HANAMI_HOST=0.0.0.0

CMD ["hanami" "server"]
