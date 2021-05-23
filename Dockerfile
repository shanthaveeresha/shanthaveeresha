FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.66/bin/apache-tomcat-8.5.66.tar.gz
RUN tar xvfz apache-tomcat-8.5.66.tar.gz
RUN cp -r apache-tomcat-8.5.66/* /usr/local/tomcat/
ADD tomcat-users.xml /apache-tomcat-8.5.66/conf
ADD context.xml /apache-tomcat-8.5.66/webapps/manager/META-INF
EXPOSE 8080
CMD ["/apache-tomcat-8.5.66/bin/catalina.sh","run"]
