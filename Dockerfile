FROM ruby:2.3.0
MAINTAINER Ivan Chong <ivan@33digital.io>

RUN apt-get update

# Install nodejs
RUN apt-get install -qq -y nodejs

# Intall software-properties-common for add-apt-repository
RUN apt-get install -qq -y software-properties-common

# Install Nginx.
# RUN add-apt-repository -y ppa:nginx/stable
# RUN apt-get update
RUN apt-get install -qq -y nginx
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
ADD docker/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/lib/nginx
# Add default nginx config
ADD docker/nginx-sites.conf /etc/nginx/sites-enabled/default

# Install foreman
RUN gem install foreman

# Rails App directory
WORKDIR /app

# Add default unicorn config
ADD docker/unicorn.rb /app/config/unicorn.rb

# Add default foreman config
ADD docker/Procfile /app/Procfile

ENV RAILS_ENV production


# Add here your preinstall lib(e.g. imagemagick, mysql lib, pg lib, ssh config)
# Install PostgreSQL lib(for pg gem)
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev

#(required) Install Rails App
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
# RUN gem install bundler
# RUN gem update --system # will throw error, workaround with 2 commands below
RUN gem install rubygems-update
RUN update_rubygems
RUN bundle install --without development test
ADD . /app

# set properg database.yml for below
# RUN rake db:create
# RUN rake db:migrate

#(required) nginx port number
EXPOSE 80

CMD bundle exec rake assets:precompile && foreman start -f Procfile
