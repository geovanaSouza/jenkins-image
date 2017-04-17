FROM jenkins:2.32.3

ENV DOCKER_VERSION 1.12.6
ENV PATH $PATH:/usr/local/bin/scripts-ci-master

USER root

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
RUN apt-get update && apt-get install -y docker-ce jq gettext xmlstarlet dos2unix

RUN wget https://github.com/geovanaSouza/scripts-ci/archive/master.zip -O /tmp/scripts-ci.zip && \
    unzip /tmp/scripts-ci.zip -d /usr/local/bin && \
    rm -rf /tmp/scripts-ci.zip
