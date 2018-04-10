# kafka manager for docker
[Kafka Manager](https://github.com/yahoo/kafka-manager) is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).
## Base Docker Image ##
* [java:8-jre](https://store.docker.com/images/java)

## Howto
### Quick Start
```
docker run -d -p 9000:9000 -e ZK_HOSTS="zookeeper:2181" -e APPLICATION_SECRET=letmein siriuszg/kafka-manager
```