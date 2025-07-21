FROM tomcat:9.0
COPY target/moocozin.war /usr/local/tomcat/webapps/
