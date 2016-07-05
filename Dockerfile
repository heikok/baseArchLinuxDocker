FROM alpine:3.4

MAINTAINER Heiko Kundlacz <heiko.kundlacz@gmail.com>

LABEL name="baseAlpine" 

ARG GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download"
ARG GLIBC_PACKAGE_VERSION="2.23-r3"
ARG GLIBC_BASE_PACKAGE_FILENAME="glibc-${GLIBC_PACKAGE_VERSION}.apk"
ARG GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-${GLIBC_PACKAGE_VERSION}.apk"
ARG GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-${GLIBC_PACKAGE_VERSION}.apk" 

COPY ${GLIBC_BASE_PACKAGE_FILENAME} /opt/ 
COPY ${GLIBC_BIN_PACKAGE_FILENAME} /opt/ 
COPY ${GLIBC_I18N_PACKAGE_FILENAME} /opt/ 

RUN apk add --no-cache wget ca-certificates bash \
    && apk add --allow-untrusted --no-cache /opt/${GLIBC_BASE_PACKAGE_FILENAME} /opt/${GLIBC_BIN_PACKAGE_FILENAME} /opt/${GLIBC_I18N_PACKAGE_FILENAME} \
    && rm /opt/${GLIBC_BASE_PACKAGE_FILENAME} /opt/${GLIBC_BIN_PACKAGE_FILENAME} /opt/${GLIBC_I18N_PACKAGE_FILENAME} 

CMD ["/bin/bash"]
