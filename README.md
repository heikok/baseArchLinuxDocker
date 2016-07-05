# heikok/filebeat

**Filebeat: Analyze Log Files in Real Time**
Get ready for the next-generation logfile collector: Filebeat. Filebeat collects, pre-processes, and forwards log files from remote sources so they can be further enriched and combined with other data sources using Logstash or directly sends the collected lines to an elasticsearch instance. https://www.elastic.co/products/beats/filebeat

- [documentation](https://www.elastic.co/guide/en/beats/filebeat/index.html)
- [sample filebeat.yml](https://github.com/elastic/filebeat/blob/master/etc/filebeat.yml)

The docker image is based on AlpineLinux. Thus it is very small and this is the reason why I baked my own.

## Supported tags and Dockerfile links

-	[`0.1`, `lastest` (*Dockerfile*)](https://github.com/heikok/filebeatDocker/blob/master/0.1/Dockerfile)

## Run Examples

### docker-cli
```
docker run \
	-v /path/to/filebeat.yml:/etc/filebeat/filebeat.yml \
	quay.io/heikok/filebeat:0.1 \
```

### Dockerfile

```Dockerfile
FROM heikok/filebeat
COPY filebeat.yml /etc/filebeat/filebeat.yml
```

### docker-compose

```yml
version "2"
services:
  filebeat:
    hostname: my_custom_hostname
    image: quai.io/heikok/filebeat:0.1
    volumes:
     - "./etc/filebeat/filebeat.yml:/etc/filebeat/filebeat.yml:rw"
    volumes_from:
     - my_other_service

```
