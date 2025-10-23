# Set the base image to fedora
FROM fedora:21

# Update the repository sources list
RUN yum update -y

ADD "./webapps" "/var/lib/tomcat/webapps"
ADD "./conf" "/etc/tomcat"
ADD "./log" "/var/log/tomcat"
ADD "./files" "/etc/ccda/files"

# Do the magic
RUN /etc/ccda/files/scripts/do-magic.sh

CMD /usr/libexec/tomcat/server start

# Expose the default port
EXPOSE 8080
