
 #
 # https://slproweb.com/download/Win64OpenSSL_Light-3_2_0.msi

 #
 # Generate RSA keypair 
 # 
 c:\openssl.exe  genpkey -algorithm RSA -out priv.pem 

  
 #
 # Write RSA numbers  
 # 
 c:\openssl rsa -noout -text -inform PEM -in priv.pem

 #
 # CRL 
 # 
 curl http://localhost/CertEnroll/nackademin-local-CA.crl -o c:\ca.crl
 c:\openssl.exe crl -text -inform DER -in c:\ca.crl

 
 curl http://crl3.digicert.com/Omniroot2025.crl -o c:\ca.crl
 c:\openssl.exe crl -text -inform DER -in c:\ca.crl

