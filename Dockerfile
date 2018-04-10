FROM java:8-jdk

LABEL maintainer="zhigang52110@sina.com"

ENV KM_VERSION=1.3.3.17 \
    KM_CONFIGFILE="conf/application.conf"

RUN cd /tmp && curl -L https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.tar.gz -o kafka-manager-${KM_VERSION}.tar.gz && \
    tar zxvf kafka-manager-${KM_VERSION}.tar.gz && cd kafka-manager-${KM_VERSION} && \
    ./sbt clean dist && tar zxvf ./target/universal/kafka-manager-${KM_VERSION}.zip -C /opt \
    rm -fr /tmp/* /root/.sbt /root/.ivy2

WORKDIR /opt/kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=${KM_CONFIGFILE}","${KM_ARGS}"]