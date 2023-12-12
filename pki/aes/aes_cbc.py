from Crypto.Cipher import AES
import os


key=b"PASSWORDASSWORDASSWORDASSWORDXXX"

iv = None 
iv = b"0000111122223333"



cipher = AES.new(key, AES.MODE_CBC,iv)
with open("tux.bmp", "rb") as f:
    clear = f.read()

clear_trimmed = clear[64:-2]

ciphertext = cipher.encrypt(clear_trimmed)

ciphertext = clear[0:64] + ciphertext + clear[-2:]

with open("tux_cbc.bmp", "wb") as f:
   f.write(ciphertext) 




