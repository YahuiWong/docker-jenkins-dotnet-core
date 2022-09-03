FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y libltdl7

ARG dockerGid=999

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group \

COPY install.sh install.sh
RUN bash install.sh
# Switch back to the jenkins user.
USER jenkins

# 整体参考：[如何建立含有 .NET Core SDK 的 Jenkins Docker Image ?](https://old-oomusou.goodjack.tw/docker/jenkins-core/#Dockerfile)
