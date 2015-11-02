# VERSION 0.9.1
# AUTHOR:         John Leach <john@brightbox.co.uk>
# DESCRIPTION:    Image with docker-registry project and dependecies for use with Brightbox Orbit
# TO_BUILD:       docker build -rm -t registry .
# TO_RUN:         docker run -e CLIENT_ID=cli-yyyyy -e CLIENT_SECRET=secret -e ORBIT_CONTAINER=docker_registry -p 5000:5000 brightbox/registry

# Latest Ubuntu LTS
FROM registry:0.9.1

RUN apt-get -q update
RUN apt-get -qy install python-lzma python-pip python-lxml python-lzo python-simplejson python-oslo.config liblzma-dev

RUN pip install docker-registry-driver-swift

ADD config.yml /etc/docker-registry.yml

env DOCKER_REGISTRY_CONFIG /etc/docker-registry.yml
env SETTINGS_FLAVOR production
env GUNICORN_OPTS ["--preload"]

expose 5000

CMD ["docker-registry"]


