FROM alpine:3.9

ENV LANG=en_US

RUN ALPINE_GLIBC_SOURCE_RSA_PUB_URL="https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub" && \
	ALPINE_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/" && \
	ALPINE_GLIBC_PACKAGE_VERSION="2.29-r0" && \
	ALPINE_GLIBC_REL_URL=${ALPINE_GLIBC_BASE_URL}/${ALPINE_GLIBC_PACKAGE_VERSION} && \
	apk add --no-cache --virtual=.build-dependencies wget ca-certificates bash && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub ${ALPINE_GLIBC_SOURCE_RSA_PUB_URL} && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-2.29-r0.apk && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-bin-2.29-r0.apk && \
	wget ${ALPINE_GLIBC_REL_URL}/glibc-i18n-2.29-r0.apk && \
	apk add glibc-2.29-r0.apk && \
	apk add glibc-bin-2.29-r0.apk && \
	apk add glibc-i18n-2.29-r0.apk && \
	rm /etc/apk/keys/sgerrand.rsa.pub && \
	/usr/glibc-compat/bin/localedef -i ${LANG} -f UTF-8 ${LANG}.UTF-8 && \
	apk del .build-dependencies && \
	rm *.apk && \
	rm "/root/.wget-hsts" && \
	apk add bash
