FROM alpine:3.9

ENV LANG=C.UTF-8
ENV ALPINE_GLIBC_SOURCE_RSA_PUB_URL="https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub"
ENV ALPINE_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/"
ENV ALPINE_GLIBC_PACKAGE_VERSION="2.29-r0"
ENV ALPINE_GLIBC_REL_URL=${ALPINE_GLIBC_BASE_URL}/${ALPINE_GLIBC_PACKAGE_VERSION}


RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates bash && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub ${ALPINE_GLIBC_SOURCE_RSA_PUB_URL} && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-2.29-r0.apk && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-bin-2.29-r0.apk && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-i18n-2.29-r0.apk && \
	apk add glibc-2.29-r0.apk && \
	apk add glibc-bin-2.29-r0.apk && \
	apk add glibc-i18n-2.29-r0.apk && \
	rm /etc/apk/keys/sgerrand.rsa.pub && \
	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 ${LANG} && \
	echo "export LANG=en_US" > /etc/profile.d/locale.sh && \
	apk del .build-dependencies && \
	rm *.apk && \
	rm "/root/.wget-hsts" && \
	apk add bash
