# Public Key (Asymmetric) Cryptography

Using a cryptographic algorithm (commonly [RSA][RSA]) two special numbers can 
be generated. A private key and a public key. The public key can be shared with 
everyone, including bad actors. The private key is _never_ shared.

[RSA]: https://en.wikipedia.org/wiki/RSA_(cryptosystem)

### Encryption

Let's say Alice wants to send a message to Bob. She can encrypt the message 
with Bob's public key. The only way to successfully decrypt the message is with 
Bob's private key, which has never been shared. This guarantees the message can 
only be read by Bob. (Alice can still be impersonated, though.)

### Digital Signatures

Let's say Alice wants to send a message to one or more parties, and wants to 
ensure that receivers of the message can verify that the message came from her 
(which means she can't be impersonated). She can "sign" the message with her 
own private key (this does _not_ reveal the private key). Now, any receiver can 
decrypt the message with Alice's public key. 

### Both

Let's say Alice wants to send a message to Bob, and also wants to ensure that 
Bob can verify that the message came from her. In this case, you can digitally 
sign the message first, and _then_ encrypt the message. For example, Alice 
signs a message with her private key, then encrypts the signed message with 
Bob's public key. Then Bob would decrypt the message with his private key, and 
"confirm the signature" using Alice's public key.

### Faking Public Keys

Let's say Charles is a bad actor and wants to trick Bob. Charles can't 
impersonate Alice so long as Alice "signs" all her messages. But, what Charles 
can do is give Bob a public key that Charles _claims_ belongs to Alice, when in 
fact it belongs to Charles. Now, if Bob sends a message intended for Alice, but 
encrypted with the fake key, it will only be able to be read by Charles. Even 
if Bob eventually finds out he has a bad key, he will still send at least one 
message that only Charles can read. That might be enough for Charles to act 
badly.

This problem is well known, and is addressed in a few ways. TLS, which puts the 
s in https, addresses this via [certificate 
authorities](https://en.wikipedia.org/wiki/Certificate_authority).
