# Generating Keystore and Truststore for One Way TLS

The [bash script] included in this directory helps to generate keystore and truststore for the server.

**Usage**

In linux or mac machines, use `JAVA_HOME=<path-to-your_JAVA_HOME> bash generate-keys-and-certs.sh`

In windows machines, the keytool commands in the shell script would be similar but requies modification according to windows OS.

**keytool**

This example uses a tool called _keytool_ which is bundled in java distribution package like OpenJDK

**truststore**

The truststore may be required if you do not want to use the default java truststore which is a file called cacerts located 
in your java installation. 

**Subject Alternative Name**

SAN or Subject Alternative name used in the script can be removed if CN is changed to localhost. SAN is required to provide 
IP address or DNS names when two or more java applications residing in different hosts want to talk to each other. SAN takes 
precedence over values specified in CN if specified. If SAN is not specified CN should match the host name of the server.

**Servers**

There are several open source servlet servers with which you can use these keystores and enable https. 
The most common one being [tomcat]. Other popular ones include jetty, jboss to name a few.

[bash script]: generate-keys-and-certs.sh
[tomcat]: https://tomcat.apache.org/