FROM phusion/passenger-ruby22:0.9.20

MAINTAINER Yunier Perez<yunier.soad@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Run Bundle in a cache efficient way
COPY ./Gemfile /tmp/
COPY ./Gemfile.lock /tmp/
RUN cd /tmp && bundle install

# Enable nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Nginx config
ADD docker/vhost.conf /etc/nginx/sites-enabled/app.conf
ADD docker/env.conf /etc/nginx/main.d/env.conf

# Prepare folders
RUN mkdir /home/app/webapp

# Add our app
COPY . /home/app/webapp
RUN chown -R app:app /home/app
WORKDIR /home/app/webapp

# Clean up when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

EXPOSE 8082

