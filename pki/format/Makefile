#
# Code from Bom resolver 
# https://8gwifi.org/jwkconvertfunctions.jsp
#
keygen: 
	@python3 keygen.py  --keygen --private priv --public  pub --kid nackademin

rsa:
	@openssl rsa  -pubin -noout -modulus -in pub.pem

jwt: 
	python3 ntoken.py > access_token
	cat access_token    |  awk -F. '{print $$2}' |  base64 -d 2> /dev/null | jq '.'

clean: 
	@rm -rf priv.jwk  priv.pem  pub.jwk  pub.pem  __pycache__ access_token 

format:
	@openssl rsa -noout -modulus -in priv.pem






