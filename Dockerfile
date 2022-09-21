# syntax=docker/dockerfile:1
FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /chibilinks-api
COPY Gemfile /chibilinks-api/Gemfile
COPY Gemfile.lock /chibilinks-api/Gemfile.lock
RUN bundle install

COPY . /chibilinks-api
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
