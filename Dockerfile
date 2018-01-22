FROM jenkins/jnlp-slave
MAINTAINER who <who@are.you>

ENV DOCKER_VERSION=17.12.0-ce \ 
    DOCKER_COMPOSE_VERSION=1.18.0 \
    GITLFS_VERSION=2.3.4

ARG DOCKER_GROUP_ID=497

USER root

RUN cd /tmp && \
    curl -sLO https://github.com/github/git-lfs/releases/download/v${GITLFS_VERSION}/git-lfs-linux-amd64-${GITLFS_VERSION}.tar.gz && \
    tar --strip-component=1 -xvf git-lfs-linux-amd64-${GITLFS_VERSION}.tar.gz -C /usr/bin/ && \
    rm -rf git-lfs-linux-amd64-${GITLFS_VERSION}.tar.gz

RUN curl -sLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar --strip-components=1 -xzf docker-${DOCKER_VERSION}.tgz -C /usr/local/bin && \
    chmod -R +x /usr/local/bin/docker && \
    rm -rf docker-${DOCKER_VERSION}.tgz

RUN curl -sL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN groupadd -g ${DOCKER_GROUP_ID} docker && \
    usermod -aG ${DOCKER_GROUP_ID} jenkins 

USER jenkins
