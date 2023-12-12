import os
from Crypto.Cipher import AES



key=b"PASSWORDASSWORDASSWORDASSWORDXXX"

iv = b"0000111122223333"
iv = None


cipher = AES.new(key, AES.MODE_GCM,iv)
with open("tux.bmp", "rb") as f:
    clear = f.read()

clear_trimmed = clear[64:-2]

ciphertext = cipher.encrypt(clear_trimmed)

ciphertext = clear[0:64] + ciphertext + clear[-2:]

with open("tux_cgm.bmp", "wb") as f:
   f.write(ciphertext) 




