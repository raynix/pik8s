FROM wordpress:php7.3-fpm-alpine AS builder

RUN apk update && apk add autoconf build-base
RUN yes '' | pecl install -f redis

FROM wordpress:php7.3-fpm-alpine

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20180731/redis.so \
  /usr/local/lib/php/extensions/no-debug-non-zts-20180731/

RUN docker-php-ext-enable redis
