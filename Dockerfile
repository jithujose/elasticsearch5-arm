FROM arm64v8/openjdk:8-jdk-buster

WORKDIR /usr

# add a non root user
RUN useradd -m elasticuser

# Download
RUN apt update
RUN apt install -y curl nano

RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.16.tar.gz

# unarchive
RUN tar -xvf elasticsearch-5.6.16.tar.gz

ADD elasticsearch.yml /usr/elasticsearch-5.6.16/config/elasticsearch.yml

RUN chown -R elasticuser: .
USER elasticuser

ENV JAVA_HOME=/usr/local/openjdk-18/bin/java
ENV discovery.type=single-node

# run
RUN cd elasticsearch-5.6.16/bin
RUN chown -R elasticuser: elasticsearch-5.6.16

EXPOSE 9200 9300
CMD cd /usr/elasticsearch-5.6.16/bin/ && ./elasticsearch
