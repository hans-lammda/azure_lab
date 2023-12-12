
# https://tutel.me/c/programming/questions/37289672/which+python+jose+library+supports+nested+jwt+signedencrypted

import os
import sys
import datetime



import jwt


from jwcrypto import jwk, jwe, jwt
from jwcrypto.common import json_encode, json_decode





def issue_token():

    fp = open("priv.pem", "r")
    signer_key = fp.read()
    fp.close()


    duration = 100 
    priv = signer_key.encode('ascii')

    signer = jwk.JWK()
    signer.import_from_pem(priv, password=None)

    claims = {} 
    now_epoch = datetime.datetime.utcnow().strftime('%s')
    now = datetime.datetime.utcnow()
    exp_epoch = (now  + datetime.timedelta(seconds=duration)).strftime('%s')
    claims['iat']  =  now_epoch
    claims['exp']  =  exp_epoch
    claims['issuer']  =  'authentication.nackademin.local'
    claims['upn']  =  'hans.lamm@nackademin.se'


    # sign the JWT
    # specify algorithm needed for JWS
    header = {
              u'alg' : 'RS256',
              'customSigHeader':'customHeaderContent'
              }
    # generate JWT
    T = jwt.JWT(header, claims)

    T.make_signed_token(signer)
    signed_token = T.serialize(compact=True)


    return signed_token





if __name__ == '__main__':
    sys.exit(print(issue_token()))








