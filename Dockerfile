FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
# Development files
  build-essential git software-properties-common \
# Python libraries
  python python-dev python-setuptools \
# uWSGI for hosting applications
  uwsgi uwsgi-plugin-python \
# Supervisor to manage the uwsgi instance
  supervisor \
# Libraries
  libpq-dev fontconfig libfontconfig1 libfreetype6 libjpeg-turbo8 libxrender1 libffi-dev \
# Useful tools
  postgresql-client curl

# Get a decent version of pip, cause ubuntu sucks
RUN easy_install -U pip>=7.0.0

# wkhtmltopdf-static, since we need the static version
ADD ./wkhtmltox-0.12.2-dev-cf53180_linux-trusty-amd64.deb /tmp/wkhtmltox.deb
RUN dpkg -i /tmp/wkhtmltox.deb
