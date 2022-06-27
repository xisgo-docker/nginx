FROM nginx:1.19.9-alpine

RUN apk add openssl && \
    openssl req -x509 -nodes -days 365 -subj \
    "/C=CA/ST=QC/O=Company, Inc./CN=localhost" \
    -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;

ENV DOCUMENT_ROOT="/var/www/app/public"
ENV TRY_FILES="\$uri \$uri/ /index.php\$is_args\$args"
ENV PHP_HOSTNAME="php"
ENV PHP_XDEBUG_HOSTNAME="php_xdebug"

COPY default.conf /etc/nginx/templates/default.conf.template
