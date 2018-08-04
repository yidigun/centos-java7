FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 7
ENV JAVA_VERSION_MINOR 80
ENV JAVA_VERSION_BUILD 15

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir -p /opt/oracle && \
    curl -jksSL http://iuinna.yidigun.com/java-archived-tmp/server-jre-7u80-linux-x64.tar.gz | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/oracle/java

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
