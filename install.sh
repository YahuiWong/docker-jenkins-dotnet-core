# Based on instructiions at https://www.microsoft.com/net/download/linux-package-manager/debian11/sdk-current
# Install dependency for .NET Core 2
apt-get update
apt-get install -y curl libunwind8 gettext apt-transport-https

# Based on instructions at https://www.microsoft.com/net/download/linux-package-manager/debian11/sdk-current
# Install microsoft.qpg & Install the .NET Core framework 

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update
apt-get install -y dotnet-sdk-2.2 dotnet-sdk-8.0 dotnet-sdk-3.1 dotnet-sdk-6.0
apt-get clean
