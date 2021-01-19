FROM debian:buster

RUN apt-get update -y && \
  apt-get install -qqy exif libimage-exiftool-perl && \
  rm -rf /var/lib/apt/lists/*
