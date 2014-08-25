# VERSION 0.1
# AUTHOR:         John Leach <john@brightbox.co.uk>
# DESCRIPTION:    Image with docker-registry project and dependecies for use with Brightbox Orbit
# TO_BUILD:       docker build -rm -t registry .
# TO_RUN:         docker run e ORBIT_AUTH_URL=https://orbit.brightbox.com/v1/acc-xxxxx -e ORBIT_USERNAME=cli-yyyyy -e ORBIT_PASSWORD=secret -e ORBIT_CONTAINER=docker_registry -p 5000:5000 registry

# Latest Ubuntu LTS
FROM registry:0.7.3

RUN apt-get -y install python-lzma python-pip python-lxml python-lzo python-simplejson python-oslo.config liblzma-dev

RUN pip install docker-registry-driver-swift

ADD config.yml /etc/docker-registry.yml

env DOCKER_REGISTRY_CONFIG /etc/docker-registry.yml
env SETTINGS_FLAVOR production

expose 5000

CMD ["docker-registry"]


