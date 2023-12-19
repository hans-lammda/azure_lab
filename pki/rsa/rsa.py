# pip3 install sympy

import random
import sympy

def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a   

def multiplicative_inverse(e, phi):
    d = 0
    x1 = 0
    x2 = 1
    y1 = 1
    temp_phi = phi

    while e > 0:
        temp1 = temp_phi//e
        temp2 = temp_phi - temp1 * e
        temp_phi = e
        e = temp2

        x = x2- temp1* x1
        y = d - temp1 * y1

        x2 = x1
        x1 = x
        d = y1
        y1 = y
        
    if temp_phi == 1:
        return d + phi

def generate_keypair(p, q):
    n = p*q
    phi = ((p-1)*(q-1))

    e = random.randrange(1, phi)

    g = gcd(e, phi)
    while g != 1:
        e = random.randrange(1, phi)
        g = gcd(e, phi)

    d = multiplicative_inverse(e, phi) 

    return ((e, n), (d, n))


def encrypt(pk, plaintext):
    key, n = pk
    cipher = [(ord(char) ** key) % n for char in plaintext]
    return cipher


def decrypt(pk, ciphertext):
    key, n = pk
    plain = [chr((char ** key) % n) for char in ciphertext]
    return ''.join(plain)


p = sympy.randprime(3, 100)
q = sympy.randprime(3, 100)
while p == q: 
  p = sympy.randprime(3, 100)
  q = sympy.randprime(3, 100)

n = p*q

public, private = generate_keypair(p, q)

message = "Nackademin" 

encrypted_msg = encrypt(public, message)

print(f"Initial numbers are : P = {p} , Q = {q}")
print(f"Modulus (n):  {p} * {q} = {n}")
print(f"public  key (e,n)  is : {public}")
print(f"private key (d,n)  is : {private}")
print (f"Message is : {message}")
print(f"Encrypted Message is : {encrypted_msg}")
print (f"Decrypted Message is : {decrypt(private,encrypted_msg)}")

