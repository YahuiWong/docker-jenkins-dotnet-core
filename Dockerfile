FROM jenkins/jenkins:2.452.3

USER root
# RUN sed -i -E 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's@deb.debian.org@mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/debian.sources
RUN apt-get update && apt-get install -y libltdl7 bash

ARG dockerGid=999

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group 

COPY install.sh install.sh
RUN bash install.sh
# Switch back to the jenkins user.
USER jenkins

# 整体参考：[如何建立含有 .NET Core SDK 的 Jenkins Docker Image ?](http://oomusou.io/docker/jenkins-core/#Dockerfile)
