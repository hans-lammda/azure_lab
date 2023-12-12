
# https://tutel.me/c/programming/questions/37289672/which+python+jose+library+supports+nested+jwt+signedencrypted

import os,sys 
import pprint 
import json 
import datetime 
from jwcrypto import jwk, jwe, jwt 
from jwcrypto.common import json_encode, json_decode
import argparse


# Dictionary for parsing command line args and options.
args_options = {'opt': [{'long': '--keygen',
                         'help': 'Generate key'}
                        ],
                'opt_w_arg': [{'long': '--private',
                               'help': 'Private key in pem format',
                               'meta': 'private',
                               'required': True},
                              {'long': '--kid',
                               'help': 'Key idenity',
                               'meta': 'kid',
                               'required': False},
                              {'long': '--public',
                               'help': 'Public key in pem format ',
                               'meta': 'public',
                               'required': True}]}


def parse_cmdline():
    """ Parse command-line and return args """
    parser = argparse.ArgumentParser(description='Compare' +
                                     'analyzed build with content of EVMS' +
                                     'output is delta update file')

    for opt in args_options['opt']:
        parser.add_argument(opt['long'], help=opt['help'], action="store_true")
    for opt_w_arg in args_options['opt_w_arg']:
        parser.add_argument(opt_w_arg['long'], help=opt_w_arg['help'],
                            metavar=opt_w_arg['meta'],
                            required=opt_w_arg['required'])
    args = parser.parse_args()
    return args

def main():

    args = parse_cmdline()
    if args.kid: 
       kid = args.kid
    else: 
       kid = 'Key id not set '

    keygen(args.public, args.private,kid)



def keygen(pub_path, priv_path,kid): 

    public_key = jwk.JWK()

    private_key = jwk.JWK.generate(kty='RSA', size=2048, kid=kid)

    public_key.import_key(**json_decode(private_key.export_public()))


    pem_pub = public_key.export_to_pem(private_key=False, password=None)
    pem_pub = pem_pub.decode("utf-8")
    pem_priv = private_key.export_to_pem(private_key=True, password=None)
    pem_priv = pem_priv.decode("utf-8")

    # openssl rsa -noout -text -inform PEM -in pub.pem -pubin

    fp = open("%s.pem" % pub_path,"w") 
    fp.write(pem_pub)
    fp.close() 

    fp = open("%s.jwk" % pub_path,"w") 
    fp.write(public_key.export())
    fp.close() 

    fp = open("%s.pem" % priv_path ,"w") 
    fp.write(pem_priv)
    fp.close() 

    fp = open("%s.jwk" % priv_path ,"w") 
    fp.write(private_key.export())
    fp.close() 
    return 


if __name__ == '__main__':
    sys.exit(main())








