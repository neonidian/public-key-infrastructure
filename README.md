# Public Key Infrastructure (PKI)


PKI in [wikipedia]

[wikipedia]: https://en.wikipedia.org/wiki/Public_key_infrastructure

### Why PKI ?

As internet grows and devices communicate with each other, there arose a requirement for secure communication between 
devices so that the data which passes through the internet cannot not be mis-used if intercepted. Data can be intercepted
since internet involves many devices like gateways and routers that relay the data. 

E.g., A user sitting in Iceland accessing a website that is hosted on a server in India has their data go through 
several gateways and routing and because of this, the data can be intercepted in those gateways and routers. 

**https**

On opening any website and if the URL of the website starts with _https_ like https://www.sample_site.com, it means that 
the website uses [encryption] which means any information sent through the website is scrambled and anybody who intercepts 
the information cannot view the actual information.

**http**

On the other hand, if a website URL starts with _http_ like http://www.oh-my-gosh.com, any information which is sent through 
the network is not encrypted and anybody like your ISPs can easily see the data that is transmitted which can lead to [spoofing].


So it is always good to check if the web pages where you enter sensitive information like Username/password, addresses, credit 
card information have _https_ in the URL bar


[encryption]: https://en.wikipedia.org/wiki/Encryption
[spoofing]: https://en.wikipedia.org/wiki/Man-in-the-middle_attack

_**The PKI is a framework that defines a framework for providing https where 's' stands for 'secured'.**_

## TLS

TLS provides a way of enabling https. It is a cryptographic protocol and succeeds it's predecessor - SSL(Secure Sockets Layer). 
There are several versions of TLS and it is recommended to use the latest version since the older versions have vulnerabilities 
like [heartbleed].

[heartbleed]: http://heartbleed.com/

#### One way TLS

The most common https that is used across the internet when you use any website that has https in the URL bar. An excerpt
from the web show how TLS works:

1. The Client browsers receives https://google.com in it’s address bar

2. Client browsers knows based on https:// that this connection will require an SSL handshake and sends a CLIENT_HELLO 
to the destined web server (google). This includes other things like SSL/TLS version, acceptable ciphers, etc

3. The web server receives the CLIENT_HELLO request and sends a SERVER_HELLO back to the client. SERVER_HELLO contains 
SSL version, acceptable ciphers, and the server certificate.

4. The client receives the servers certificate and it is verified against a list of known Certificate Authorities.

5. If the certificate is proven to be in good standing, the client sends back a pre-master secret is encrypted inside 
the server’s certificate. Remember only the server can decrypt anything encrypted with it’s certificate because only the 
server has the decryption key. Server Certificate encrypts, Server Key decrypt’s.

6. At this point both client and server have the pre-master secret and can calculate a master secret to use to 
symmetrically encrypt and decrypt data between them.

If you want to know what data packets are transferred and received, you can use packet capture softwares like [wireshark]

[wireshark]: https://www.wireshark.org

See the sub-directory [one-way-tls-using-java-keytool] about generating keystore. This generation uses pkcs12 format
which can be used for any applications which supports this format.

[one-way-tls-using-java-keytool]:one-way-tls-using-java-keytool/

#### Two way TLS

In case of two-way TLS, both client and server authenticate each other to ensure that both parties involved in the communication 
are trusted. 

Both parties share their public certificates to each other and then verification/validation is performed based on that.

Below is the high level description of the steps involved in establishment of connection and transfer of data between a 
client and server in case of two-way SSL:

1. Client requests a protected resource over HTTPS protocol and the SSL/TSL handshake process begins.

2. Server returns its public certificate to the client along with server hello. 

3. Client validates/verifies the received certificate. Client verifies the certificate through certification authority (CA) 
for CA signed certificates.

4. If Server certificate was validated successfully, client will provide its public certificate to the server.

5. Server validates/verifies the received certificate. Server verifies the certificate through certification authority (CA) 
for CA signed certificates.

6. After completion of handshake process, client and server communicate and transfer data with each other encrypted with 
the secret keys shared between the two during handshake. 

See the sub-directory [two-way-tls-using-java-keytool] about generating keystore. This generation uses pkcs12 format
which can be used for any applications which supports this format.

[two-way-tls-using-java-keytool]:two-way-tls-using-java-keytool/

##### Certificate Based Authentication

Certificate based authentication is a feature that can be used on addition to Two way TLS so that a form login is not 
required. This requires configuring the application to be deployed in a server to use certificate based authentication 
and no extra step required if the two way TLS works already.