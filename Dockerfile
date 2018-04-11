FROM ubuntu:latest
MAINTAINER Steven Fourie "stevenfx@outlook.com"

ENV JAVA_HOME /usr/lib/jvm/java-9-oracle
ENV JRE_HOME ${JAVA_HOME}/jre
ENV GRADLE_VERSION=4.6
ENV GRADLE_HOME=/opt/gradle/gradle-$GRADLE_VERSION
ENV PATH=$PATH:$GRADLE_HOME/bin
WORKDIR /tmp
RUN apt-get update
RUN apt-get install software-properties-common python-software-properties unzip -y
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java9-installer -y
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip \
&& mkdir /opt/gradle \
&& unzip -d /opt/gradle gradle-${GRADLE_VERSION}-all.zip
WORKDIR /root
