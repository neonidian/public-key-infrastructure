#!/bin/bash

# Step 1: Generate a keystore with RSA alogorithm and a key size of 2048-bits
openssl genrsa -out mydomain.key 2048

# Step 2: Extract public key from the private key generated in step 1
openssl rsa -in mydomain.key -pubout -out mypublickey.key

# Step 3: Optionally, if you would like to get your own certificate from a CA(Certificate Authority) instead of a self-signed certificate,
#         create a CSR(Certificate Signing Request) and sent it to the CA
openssl req -new -key mydomain.key -out mydomain.csr


