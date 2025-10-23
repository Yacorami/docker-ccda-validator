#!/bin/bash
set -e

echo "Installing dependencies..."
yum -y install java-1.8.0-openjdk zip unzip tomcat tomcat-native curl

echo "Creating required directories..."
mkdir -p /etc/ccda/files/validator_configuration/vocabulary/{valueset_repository/VSAC,code_repository}
mkdir -p /etc/ccda/files/validator_configuration/scenarios_directory
mkdir -p /etc/tomcat/Catalina/localhost

echo "Downloading Reference C-CDA Validator v3.1.75 (USCDI v3 / Cures Update)..."
curl -L https://github.com/siteadmin/reference-ccda-validator/releases/download/3.1.75/referenceccdaservice.war \
  -o /var/lib/tomcat/webapps/referenceccdaservice.war

echo "Copying Tomcat configuration files..."
cp -f /etc/ccda/files/config_extra/web.xml /etc/tomcat/web.xml
cp -f /etc/ccda/files/config_extra/referenceccdaservice.xml /etc/tomcat/Catalina/localhost/referenceccdaservice.xml
