FROM kindest/node:v1.14.2
RUN sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list 
RUN apt-get update 
RUN apt-get -y install nfs-common 