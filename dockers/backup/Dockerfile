FROM debian:buster

RUN apt-get update -qqy && \
  apt-get install mariadb-client postgresql-client && \
  rm -rf /var/lib/apt/lists/*
