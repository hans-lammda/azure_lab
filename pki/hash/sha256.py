import hashlib
  
filename = "sha256.py"
with open(filename,"rb") as f:
    bytes = f.read() 
    hash = hashlib.sha256(bytes).hexdigest();
    print(hash)
