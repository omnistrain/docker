FROM alpine:3.19.1
ENV FTP_USER=foo \
	FTP_PASS=bar \
	GID=1000 \
	UID=1000

RUN apk add --no-cache --update \
	vsftpd==3.0.5-r2

COPY [ "/src/vsftpd.conf", "/etc" ]
COPY [ "/src/docker-entrypoint.sh", "/" ]
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 20/tcp 21/tcp 40000-40009/tcp