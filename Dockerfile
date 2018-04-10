FROM java:8-jdk AS builder

ENV KM_VERSION="1.3.3.17"

RUN cd /tmp && curl -L https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.tar.gz -o kafka-manager-${KM_VERSION}.tar.gz \
    && tar zxvf kafka-manager-${KM_VERSION}.tar.gz && cd kafka-manager-${KM_VERSION} \
    && echo 'scalacOptions ++= Seq("-Xmax-classfile-name", "200")' >> build.sbt \
    && ./sbt clean dist && unzip -d /opt ./target/universal/kafka-manager-${KM_VERSION}.zip \
    && mv /opt/kafka-manager-${KM_VERSION} /opt/kafka-manager \
    && rm -rf /tmp/* /root/.sbt /root/.ivy2

FROM java:8-jre
LABEL maintainer="zhigang52110@sina.com"

ENV KM_CONFIGFILE="conf/application.conf"

COPY --from=builder /opt/kafka-manager /opt/kafka-manager
WORKDIR /opt/kafka-manager

EXPOSE 9000

ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=${KM_CONFIGFILE}","${KM_ARGS}"]