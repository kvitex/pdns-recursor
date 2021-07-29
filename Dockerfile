FROM alpine:3.14

LABEL image_name="kvitex/pdns-recursor"
LABEL maintainer="kvitex@gmail.com"

RUN  apk update && apk add --no-cache pdns-recursor=4.4.3-r4

COPY recursor.conf /etc/pdns/recursor.conf

ENTRYPOINT [ "/usr/sbin/pdns_recursor" ]
EXPOSE 53/tcp
EXPOSE 53/udp
