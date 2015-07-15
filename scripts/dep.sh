#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl ca-certificates

# database
cat <<__EOT__ | debconf-set-selections
mysql-server-5.5 mysql-server/root_password_again password password
mysql-server-5.5 mysql-server/root_password password password
mysql-server-5.5 mysql-server-5.5/postrm_remove_databases boolean false
mysql-server-5.5 mysql-server-5.5/start_on_boot boolean true
mysql-server-5.5 mysql-server-5.5/really_downgrade boolean false
__EOT__
apt-get -y install mysql-server

# application
apt-get -y --no-install-recommends install \
autoconf \
automake \
bzip2 \
file \
g++ \
gcc \
imagemagick \
libbz2-dev \
libc6-dev \
libcurl4-openssl-dev \
libevent-dev \
libffi-dev \
libglib2.0-dev \
libjpeg-dev \
liblzma-dev \
libmagickcore-dev \
libmagickwand-dev \
libmysqlclient-dev \
libncurses-dev \
libpq-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libtool \
libxml2-dev \
libxslt-dev \
libyaml-dev \
make \
patch \
xz-utils \
zlib1g-dev \
git \
nodejs \
mysql-client \
postgresql-client \
sqlite3

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.1.6
gem install bundler

# cleanup
apt-get clean
