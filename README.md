# CMAK (Cluster Manager for Apache Kafka, previously known as Kafka Manager)

[CMAK](https://github.com/yahoo/CMAK)(previously known as Kafka Manager) is a tool for managing [Apache Kafka](http://kafka.apache.org).

## Quick Start

### Build Command

```bash
./build.sh <VERSION>
```

### Docker Pull Command

```bash
docker pull siriuszg/cmak:<TAG>
```

### Docker Run Command

```bash
docker run -d -p 9000:9000 -e ZK_HOSTS="zookeeper:2181" -e APPLICATION_SECRET=letmein siriuszg/cmak
```

## Docker Tag

* base image from openjdk:11.0.14.1-jre
  * 3.0.0.5, latest
  * 3.0.0.4
  * 3.0.0.3
  * 3.0.0.2
