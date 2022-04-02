FROM openjdk:11.0.14.1-jre

LABEL maintainer="zhigang52110@sina.com"

ENV CMAK_VERSION="3.0.0.5"

RUN curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o cmak-${CMAK_VERSION}.zip \
    && unzip cmak-${CMAK_VERSION}.zip \
    && mv cmak-${CMAK_VERSION} cmak \
    && rm -rf cmak-${CMAK_VERSION}.zip

WORKDIR /cmak

EXPOSE 9000

CMD ["bin/cmak"]