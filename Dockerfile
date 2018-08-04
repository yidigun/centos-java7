FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 7
ENV JAVA_VERSION_MINOR 80
ENV JAVA_VERSION_BUILD 15

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir -p /opt/oracle && \
    curl -jksSL http://iuinna.yidigun.com/java-archived-tmp/server-jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/oracle/java && \
    (cd /opt/oracle/java; \
     rm -rf *src.zip \
       lib/visualvm \
       lib/*javafx* \
       jre/lib/*javafx* \
       jre/lib/*jfx* \
       jre/lib/amd64/fx*.so \
       jre/lib/amd64/libprism*.so \
       jre/lib/amd64/libglass.so \
       jre/lib/amd64/libjavafx*.so \
       jre/lib/amd64/libjfx*.so \
       jre/lib/amd64/libgstplugins-lite.so \
       jre/lib/amd64/libgstreamer-lite.so) && \
    yum -y clean all && \
    rm -rf /var/cache/yum

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
