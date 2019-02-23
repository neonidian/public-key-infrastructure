#!/bin/bash

# Step 1: Generating a key pair. SAN or subject alternative mentioned below should have IP or DNS of machines that host the servers which may want to communicate with each other
$JAVA_HOME/bin/keytool -genkeypair -alias sample -keyalg RSA -keysize 2048 -keystore server.keystore -storepass changeit -validity 365 -deststoretype pkcs12 -ext SAN=dns:localhost,ip:127.0.0.1  -dname "cn=neonidian, ou=sample-ou, o=sample-org, c=IN"

# Step 2: Export certificate from the generated keystore
$JAVA_HOME/bin/keytool -exportcert -alias sample -keypass changeit -keystore server.keystore -file cert.crt -storepass changeit

# Step 3: Using the generated certificate to create a truststore
$JAVA_HOME/bin/keytool -import -file cert.crt -alias sample -keystore server.truststore -storepass changeit -noprompt

# To check the content of the keystore use,
# $JAVA_HOME/bin/keytool -list -v -keystore <keystore name> # In this example, <keystore name> can be 'server.keystore' or 'server.truststore'