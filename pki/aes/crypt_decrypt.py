import hashlib
import os
from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes

password=b"Very_secret"
salt = get_random_bytes(32)
key = hashlib.scrypt(password, salt=salt, n=2**14, r=8, p=1, dklen=32)

mode = AES.MODE_GCM
plain = b"Fikapaus Nackademin 2022"
cipher = AES.new(key, mode)
ciphertext, tag = cipher.encrypt_and_digest(plain)
file_out = open("aes_cgm.bin", "wb")
[ file_out.write(x) for x in (cipher.nonce, tag, ciphertext) ]
file_out.close()


file_in = open("aes_cgm.bin", "rb")
nonce, tag, ciphertext = [ file_in.read(x) for x in (16, 16, -1) ]

cipher = AES.new(key, mode, nonce)
decrypted_data = cipher.decrypt_and_verify(ciphertext, tag)
print(decrypted_data.decode('UTF-8'))
