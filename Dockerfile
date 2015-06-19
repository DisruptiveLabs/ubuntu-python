FROM ubuntu:14.04
MAINTAINER Franklyn Tackitt <frank@comanage.com>

COPY ./pgdg-key.asc /tmp/pgdg-key.asc
COPY ./wkhtmltox-0.12.2-dev-cf53180_linux-trusty-amd64.deb /tmp/wkhtmltox.deb

RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main >> /etc/apt/sources.list.d/pgdg.list && \
    apt-key add /tmp/pgdg-key.asc && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
# Development files
      build-essential \
      git \
      software-properties-common \
# Python libraries
      python \
      python-dev \
      python-setuptools \
# uWSGI for hosting applications
      uwsgi \
      uwsgi-plugin-python \
# Supervisor to manage the uwsgi instance
      supervisor \
# Libraries
      libpq-dev \
      fontconfig \
      libfontconfig1 \
      libfreetype6 \
      libjpeg-turbo8 \
      libxrender1 \
      libffi-dev \
# Useful tools
      postgresql-client-9.4 \
      curl && \
    apt-get clean && \
    easy_install -U pip && \
# wkhtmltopdf-static, since we need the static version
    dpkg -i /tmp/wkhtmltox.deb && \
# Just install this now, since its a big build
    pip install \
      cryptography \
      newrelic \
      urllib3 \
      pyopenssl \
      ndg-httpsclient \
      pyasn1 \
      six
