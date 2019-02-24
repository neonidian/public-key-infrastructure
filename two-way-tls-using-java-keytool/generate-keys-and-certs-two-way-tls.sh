#!/bin/bash

#### Generate keystore, truststore, certificate for SERVER

# Step 1: Generating a key pair. SAN or subject alternative mentioned below should have IP or DNS of machines that host the servers which may want to communicate with each other
$JAVA_HOME/bin/keytool -genkeypair -alias sample-server -keyalg RSA -keysize 2048 -keystore server.keystore -storepass changeit -validity 365 -deststoretype pkcs12 -ext SAN=dns:localhost,ip:127.0.0.1  -dname "cn=neonidian-server, ou=sample-ou, o=sample-org, c=IN"

# Step 2: Export certificate from the generated keystore
$JAVA_HOME/bin/keytool -exportcert -alias sample-server -keypass changeit -keystore server.keystore -file server-cert.crt -storepass changeit

# Step 3: Using the generated certificate to create a truststore
$JAVA_HOME/bin/keytool -import -file server-cert.crt -alias sample-server -keystore server.truststore -storepass changeit -noprompt


#### Generate keystore, truststore, certificate for CLIENT

# Step 4: Generating a key pair for client
$JAVA_HOME/bin/keytool -genkeypair -alias sample-client -keyalg RSA -keysize 2048 -keystore client.keystore -storepass changeit -validity 365 -deststoretype pkcs12 -ext SAN=dns:localhost,ip:127.0.0.1  -dname "cn=neonidian-client, ou=sample-ou, o=sample-org, c=IN"

# Step 5: Export certificate from the generated keystore
$JAVA_HOME/bin/keytool -exportcert -alias sample-client -keypass changeit -keystore client.keystore -file client-cert.crt -storepass changeit

# Step 6: Using the generated certificate to create a truststore
$JAVA_HOME/bin/keytool -import -file client-cert.crt -alias sample-client -keystore client.truststore -storepass changeit -noprompt


#### Import client's certificate into server's truststore AND server's certificate into client's truststore

# Step 7: Import client's certificate into server's truststore
$JAVA_HOME/bin/keytool -import -file client-cert.crt -alias sample-client -keystore server.truststore -storepass changeit -noprompt

# Step 8. Import server's certificate into client's truststore
$JAVA_HOME/bin/keytool -import -file server-cert.crt -alias sample-server -keystore client.truststore -storepass changeit -noprompt