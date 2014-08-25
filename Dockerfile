# VERSION 0.1
# DOCKER-VERSION  0.7.3
# AUTHOR:         John Leach <john@brightbox.co.uk>
# DESCRIPTION:    Image with docker-registry project and dependecies
# TO_BUILD:       docker build -rm -t registry .
# TO_RUN:         docker run -p 5000:5000 registry

# Latest Ubuntu LTS
FROM registry:0.7.3

RUN apt-get -y install python-lzma python-pip python-lxml python-lzo python-simplejson python-oslo.config liblzma-dev

RUN pip install docker-registry-driver-swift

ADD config.yml /etc/docker-registry.yml

env DOCKER_REGISTRY_CONFIG /etc/docker-registry.yml
env SETTINGS_FLAVOR production

expose 5000

cmd exec docker-registry


