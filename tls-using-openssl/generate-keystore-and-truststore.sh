#!/bin/bash

# Step 1: Generate a keystore(private key) with RSA alogorithm and a key size of 2048-bits
openssl genrsa -out mydomain.key 2048

# Step 2: Extract public key from the private key generated in step 1
openssl rsa -in mydomain.key -pubout -out mypublickey.key

# Step 3: Optionally, if you would like to get your own certificate from a CA(Certificate Authority) instead of a self-signed certificate,
#         create a CSR(Certificate Signing Request) and sent it to the CA
openssl req -new -key mydomain.key -out mydomain.csr -subj "/C=SE/ST=Stockholm/L=Hasselby/O=Mitt Company, Inc./OU=IT/CN=mydomain.com"

# Step 4: To create a self-signed certificate from the CSR generated in Step 3
#         The certificate generated in this step can be added to a trust store or to a browser to trust a website
openssl x509 -req -in mydomain.csr -signkey mydomain.key -out mycert.crt -days 3650

# Step 5: View the certificate generated in Step 4
openssl x509 -text -in mycert.crt -noout



## Verify keys match with openssl commands using the hash of certificate, private key and CSR. All the 3 hashes should match
openssl x509 -modulus -in mycert.crt -noout | openssl sha256
openssl rsa -modulus -in mydomain.key -noout | openssl sha256
openssl req -modulus -in mydomain.csr -noout | openssl sha256
