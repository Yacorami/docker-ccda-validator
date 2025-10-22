#!/bin/bash
set -e

echo "Install dependencies..."
yum -y install java-1.8.0-openjdk zip unzip tomcat tomcat-native curl

echo "Make directories to make sure they are there..."
mkdir -p /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC
mkdir -p /etc/ccda/files/validator_configuration/vocabulary/code_repository
mkdir -p /etc/ccda/files/validator_configuration/scenarios_directory
mkdir -p /etc/tomcat/Catalina/localhost

echo "Copying validator-api xlsx's..."
cp /etc/submodules/code-validator-api/codevalidator-api/docs/ValueSetsHandCreatedbySITE/*.xlsx \
   /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC/ || true

echo "Downloading Reference C-CDA Validator v3.1.75 (USCDI v3 / Cures Update)..."
curl -L https://github.com/siteadmin/reference-ccda-validator/releases/download/3.1.75/referenceccdaservice.war \
  -o /var/lib/tomcat/webapps/referenceccdaservice.war

echo "Copying Tomcat config files..."
cp -f /etc/ccda/files/config_extra/web.xml /etc/tomcat/web.xml
cp -f /etc/ccda/files/config_extra/referenceccdaservice.xml \
      /etc/tomcat/Catalina/localhost/referenceccdaservice.xml

echo "Cleaning old vocab (if any Excel sheets remain)..."
find /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC -type f -name '*.xls*' -delete || true

echo "Done setting up Reference C-CDA Validator (v3.1.75, USCDI v3)."
echo "---------------------------------------------------------------"
echo "Tomcat will be started automatically when the container runs."
echo "Access the UI at:"
echo "  http://localhost:8080/referenceccdaservice/ui/"
echo "---------------------------------------------------------------"
