FROM ubuntu:latest

# Comandos para instalar e comecar o tomcat
RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install software-properties-common curl
RUN apt-get -y install openjdk-8-jre-headless

RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz
RUN tar xzf apache-tomcat-9.0.43.tar.gz

COPY myapps /apache-tomcat-9.0.43/webapps/

CMD apache-tomcat-9.0.43/bin/startup.sh && tail -f apache-tomcat-9.0.43/logs/catalina.out

# Criacao do volume
VOLUME /home/p7-vol

# Expor a porta default do tomcat
EXPOSE 8080
