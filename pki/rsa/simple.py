
def rsa(key, n, data):
    return data ** key % n 

public   =  5
private  =  11
n = 14 

data = 2
encrypted_data  = rsa(public, n, data)
decrypted_data  = rsa(private, n, encrypted_data) 

print (f"\nInput: {data} encrypted with keypair ({public},{n})  becomes {encrypted_data}\n")
print (f"\nInput: {encrypted_data} decrypted with keypair ({private},{n})  becomes {decrypted_data}\n")

