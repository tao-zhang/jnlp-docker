## Purpose

Run Jenkins JNLP slave service in a container with docker/docker-compose. This docker file is based on standard jenkins ([jnlp slave](https://hub.docker.com/r/jenkins/jnlp-slave/))

## Usage

To run docker in docker ([sibling strategy](https://www.develves.net/blogs/asd/2016-05-27-alternative-to-docker-in-docker/)) start container with the host `docker.sock` mounted

    docker run [options] -v /var/run/docker.sock:/var/run/docker.sock jnlp-docker -url http://jenkins-server:port <secret> <agent name>

