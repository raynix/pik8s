FROM debian:buster

RUN apt-get update -qqy && \
  apt-get install -qqy mariadb-client postgresql-client && \
  rm -rf /var/lib/apt/lists/*
