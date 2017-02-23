FROM ruby:2.3.1-onbuild

MAINTAINER Rogier Wessel <rhwessel@xs4all.nl>

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle update || bundle install

ADD app.rb app.rb
RUN chmod +x app.rb
CMD ["./app.rb"]
