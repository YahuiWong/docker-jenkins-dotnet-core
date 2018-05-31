FROM jenkins/jenkins:lts

# Switch to root to install .NET Core SDK
USER root

# Show distro information!
RUN uname -a && cat /etc/*release

# Based on instructiions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install dependency for .NET Core 2
RUN apt-get update
RUN apt-get install -y curl libunwind8 gettext apt-transport-https

# Based on instructions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install microsoft.qpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'

# Install the .NET Core framework
RUN apt-get update
RUN apt-get install -y dotnet-sdk-2.1.4

# Switch back to the jenkins user.
USER jenkins

# 整体参考：[如何建立含有 .NET Core SDK 的 Jenkins Docker Image ?](http://oomusou.io/docker/jenkins-core/#Dockerfile)