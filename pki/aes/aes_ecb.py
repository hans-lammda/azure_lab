from Crypto.Cipher import AES
import os


key=b"PASSWORDASSWORDASSWORDASSWORDXXX"



cipher = AES.new(key, AES.MODE_ECB)
with open("tux.bmp", "rb") as f:
    clear = f.read()

clear_trimmed = clear[64:-2]

ciphertext = cipher.encrypt(clear_trimmed)

ciphertext = clear[0:64] + ciphertext + clear[-2:]

with open("tux_ecb.bmp", "wb") as f:
   f.write(ciphertext) 




