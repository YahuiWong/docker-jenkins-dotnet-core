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
# Install microsoft.qpg & Install the .NET Core framework 
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg 
RUN     mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ 
RUN     wget -q https://packages.microsoft.com/config/debian/9/prod.list 
RUN     mv prod.list /etc/apt/sources.list.d/microsoft-prod.list 
RUN    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg 
RUN     chown root:root /etc/apt/sources.list.d/microsoft-prod.list
RUN     apt-get update
RUN     apt-get install dotnet-sdk-2.1

# Switch back to the jenkins user.
USER jenkins

# 整体参考：[如何建立含有 .NET Core SDK 的 Jenkins Docker Image ?](http://oomusou.io/docker/jenkins-core/#Dockerfile)
