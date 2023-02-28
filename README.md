# README

This repo contains a `Dockerfile` and `elasticsearch.yml` settings to build an elasticsearch image.

Current versions available are:

- 5.1.16

# Build Notes

```
docker build -t elasticsearch5-arm .
docker image tag elasticsearch5-arm jithujose/elasticsearch5-arm:latest
docker image push jithujose/elasticsearch5-arm:latest
```