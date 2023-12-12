# Public Key Infrastructure 

## Intro
This directory contains a very simple CA server capable of signing 
certificate sign request ( CSR ) 

## For the impatient 

  edit req.cnf 
    replace XXX.ucm.ericsson.net with required subject name 

$ make quick 
  Executes the sequence of prepare, csr, sign 


$ make clean 
  Clean up files prior to push back states to repository 



## prepare 

This will generated the keypair for self signed CA. 



```
$ make prepare 

Country Name (2 letter code) [AU]:SE
State or Province Name (full name) [Some-State]:Stockholm
Locality Name (eg, city) []:Nacka
Organization Name (eg, company) [Internet Widgits Pty Ltd]:nackademin
Organizational Unit Name (eg, section) []:education
Common Name (e.g. server FQDN or YOUR name) []:ca.nackademin.se
Email Address []:hans.lamm@nackademin.se


```
This target retrieves the private key and self signed certificate 
from encrypted storage using pass utility.  

## Create Certificate Sign Request (CSR ) 

edit the req.cnf 
...
CN = XXX.nackademin.se
...

```
$ make csr 

```

You should have priv.pem and input/csr.pem as a result 


## Process certificate sign request 

Important Note: 
 Since CA must keep track of serial number used among other files, there is some files 
 being updated. Further the policy states that each certificate must have a unique 
 subject name (unique_subject = yes). 


```
$ make sign 

```

## Additional rules  

#### make PKCS12 file  

This target is used for creating files. 

$ make p12 


#### Verify certificate 

$ make verify 

  compare modulus of certificate and key, also write attributes in issued certificate


#### Clean

$ make clean 
  Revert the state of the CA to state of the remote repository.  



# References 

 [GitHub - chrisl84/certautomator: Automate the creation of keys and self-signed certificates](https://github.com/chrisl84/certautomator)

