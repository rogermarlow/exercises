# Extract modulus and exponent of the public key of a site
echo | openssl s_client -connect cnn.com:443 -servername cnn.com 2>&1 | awk '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/' | openssl x509 -pubkey -noout | openssl rsa -pubin -text -noout
