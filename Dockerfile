FROM ubuntu:18.04

RUN apt-get update -qq

RUN apt-get -y install \
    curl \
    git \
    git-core \
    imagemagick \
    libmagickwand-dev \
    libmysqlclient-dev \
    mysql-client \
    openssl \
    libsqlite3-dev \
    sqlite3

# required for ruby-build
RUN apt-get -y install \
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm5 \
    libgdbm-dev

# ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git /tmp/ruby-build && \
    cd /tmp/ruby-build && \
    ./install.sh && \
    cd / && \
    rm -rf /tmp/ruby-build

RUN ruby-build -v 2.6.5 /usr/local
RUN gem install bundler rubygems-bundler -no-ri-no-rdoc
RUN gem regenerate_binstubs
