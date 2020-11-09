FROM fulsome/alpine:
LABEL Maintainer="Brian Robertson <brian@fulso.me>" \
      Description="Minimal nginx"

RUN apk add --no-cache nginx

RUN adduser -D -g 'www' www

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx &&\
    chown -R www:www /www &&\
    chown -R www:www /var/log &&\
    chown -R www:www /run

EXPOSE 8080
USER www
# define user in nginx and php, run init as root
CMD ["nginx", "-g", "daemon off;"]
