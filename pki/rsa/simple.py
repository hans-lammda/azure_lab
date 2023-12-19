# https://www.online-python.com

# RSA Algorithm 
def rsa(key, n, data):
    return data ** key % n

# Public Keypair 
public=5
n=14

# Private  Keypair 
private= 11 
n=14 

#data to be encrypted  
data = 2 
print(data)

# encrypt 
enc_data  = rsa(public, n, data)
print(enc_data)

decrypted_data = rsa(private, n, enc_data)
print(decrypted_data)
