# NAME:     w11th/qczhz
FROM homeland/base:0.2.0

ENV RAILS_ENV 'production'

MAINTAINER w11th "https://github.com/w11th"

RUN useradd ruby -s /bin/bash -m -U &&\
    mkdir -p /var/www &&\
    cd /var/www &&\
    git clone --branch product https://github.com/w11th/homeland.git --depth 1
RUN cd /var/www/homeland && bundle install --deployment &&\
    find /var/www/homeland/vendor/bundle -name tmp -type d -exec rm -rf {} + &&\
    chown -R ruby:ruby /var/www

WORKDIR /var/www/homeland
