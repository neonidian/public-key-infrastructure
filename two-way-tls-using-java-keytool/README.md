# Generating Keystore and Truststore for Two Way TLS

The [bash script] included in this directory helps to generate keystore and truststore for the server and client.

**Usage**

In linux or mac machines, use `JAVA_HOME=<path-to-your_JAVA_HOME> bash generate-keys-and-certs-two-way-tls.sh`

In windows machines, the keytool commands in the shell script would be similar but requies modification according to windows OS.

How it works: Mentioned in the shell script as comments.

**Configure a server**

This involves configuring the server with its keystore and truststore. For java applications, you may want to pass
the keystore(_sever.keystore_) and truststore(_server.truststore_) as JAVA_OPTS parameter. 

Keystore is required to be passed in JAVA_OPTS for two way TLS if the application has multiple endpoints that want to 
authenticate with each other. If there is only single endpoint, passing the truststore in JAVA_OPTS variable would suffice. 

**Configure a client**

The final step in the process involves configuring the client with keystore. If client is a browser, import _client.keystore_
into browser certificates under 'Your certificates' section.

**Keytool**

This example uses a tool called _keytool_ which is bundled in java distribution package like OpenJDK

**Truststore**

The truststore may be required if you do not want to use the default java truststore which is a file called cacerts located 
in your java installation. 

**Subject Alternative Name**

SAN or Subject Alternative name used in the script can be removed if CN is changed to localhost. SAN is required to provide 
IP address or DNS names when two or more java applications residing in different hosts want to talk to each other. SAN takes 
precedence over values specified in CN if specified. If SAN is not specified CN should match the host name of the server.

**Servers**

There are several open source servlet servers with which you can use these keystores and enable https. 
The most common one being [tomcat]. Other popular ones include jetty, jboss, undertow to name a few.

Microservice oriented frameworks like springboot which internally use popular servers can also be used
to test TLS.

A servlet based application is required to host it in servers to test https.

[bash script]: generate-keys-and-certs-two-way-tls.sh
[tomcat]: https://tomcat.apache.org/
