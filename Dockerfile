FROM ubuntu:18.04

RUN apt update

RUN apt install curl -y

RUN apt install default-jdk -y

WORKDIR /opt/tomcat

RUN curl -O https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.40/bin/apache-tomcat-9.0.40.tar.gz

RUN tar xvfz apache*.tar.gz

RUN mv apache-tomcat-9.0.40/* /opt/tomcat/.

WORKDIR /opt/tomcat/webapps

ADD hello-1.0.war .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


