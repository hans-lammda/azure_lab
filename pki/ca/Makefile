# https://learn.microsoft.com/en-us/azure/iot-hub/tutorial-x509-openssl

prepare:
	mkdir -p input 
	mkdir -p output 
	mkdir -p db.certs
	mkdir -p ca/keys
	mkdir -p ca/state
	touch ca/state/db.index
	touch ca/state/db.random
	openssl rand -hex 16 > ca/state/db.serial
	openssl genrsa -out ca/keys/root.key 2048 
	openssl req -x509 -sha256 -new -nodes -key ca/keys/root.key -days 3650 -out ca/keys/root.crt -config openssl.cnf

# edit req.cnf before executing this target. 


UUID = $(shell uuidgen)

keygen: 
	@openssl genrsa -out output/priv.pem  2048 

keygen_jwk: 
	@python3  keygen.py  --public output/pub  --private output/priv --keygen --kid $(UUID)

csr:
	@openssl req -new -key output/priv.pem -out output/csr.pem -config req.cnf 


sign:
	openssl ca -config ca.conf -in output/csr.pem -out  output/cert.pem -notext -batch 
	openssl rsa -in output/priv.pem  -pubout > output/pubkey.pem

# Clean up before commit back to repository 
clean: 
	rm -rf input output  db.certs ca 

#  All steps in rule, for the impatient 
quick: clean prepare keygen csr sign p12

		
#  Reset all changed files 
reset:
	git checkout db.index
	git checkout db.random
	git checkout db.serial
	rm -f *.old
	

#  Compare modulus of private key, public cert and sign request 
verify:
	-openssl x509  -noout -text -in output/cert.pem
	-openssl req  -noout -text  -in output/csr.pem
	-openssl rsa  -noout -modulus -in output/priv.pem
	-openssl rsa  -pubin -noout -modulus -in output/pubkey.pem
	-openssl x509  -noout -modulus -in output/cert.pem
	-openssl verify  -CAfile ca/keys/root.crt   output/cert.pem


# Convert pem files to PKCS12 format, required for import to browser
p12:
	openssl pkcs12 -export -passout pass:qwerty -out output/certificate.pfx -inkey output/priv.pem -in output/cert.pem  -certfile output/cert.pem


