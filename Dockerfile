FROM tomcat:9.0.58-jdk17-openjdk-slim
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps/

# Comment lines 21 and 22 in context.xml
RUN sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
RUN sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /usr/local/tomcat/webapps/manager/META-INF/context.xml

# Add GUI user to config/tomcat-users.xml
RUN sed -i '56i \
	<role rolename="manager-gui"/> \
	<role rolename="admin-gui"/> \
	<role rolename="manager-script"/> \
	<role rolename="manager-jmx"/> \
	<role rolename="manager-status"/> \
	<user username="admin" password="admin" roles="manager-gui,admin-gui,manager-script"/> \
' /usr/local/tomcat/conf/tomcat-users.xml

# Copy war file to the tomcat container
COPY ./*.war /usr/local/tomcat/webapps
