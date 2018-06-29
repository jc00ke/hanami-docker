FROM ruby:2.5.1-alpine

LABEL maintainer="jesse@relativepath.io"

#RUN bundle config --global frozen 1

#RUN mkdir /usr/src/spike
#WORKDIR /usr/src/spike

#COPY .ruby-version Gemfile Gemfile.lock ./
#RUN bundle install

#COPY . .

#ENV LANG=C.UTF-8
#ENV HANAMI_ENV=production
#ENV HANAMI_HOST=0.0.0.0

#EXPOSE 2300

#CMD ["hanami" "server"]





ADD Gemfile /app
ADD Gemfile.lock /app
WORKDIR /app
RUN bundle install

ADD . /app

EXPOSE 2300

ENV LANG=C.UTF-8
ENV HANAMI_ENV=production
ENV HANAMI_HOST=0.0.0.0

CMD ["hanami" "server"]
