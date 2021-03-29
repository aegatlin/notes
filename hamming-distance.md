# Hamming Distance

These are notes I took on Hamming Distance and some of the mathematical implications that can be used in applied cryptography from back when I was learning to program.

## Notes on XOR

XOR = Exclusive Or. In a typical truth value table that means TF and FT become T, and TT and FF become F. In this construction, we set 1 to T and 0 to F. Let's look at the single bit table.

| #   | 1st | 2nd | Result |
| --- | --- | --- | ------ |
| 1   | 0   | 0   | 0      |
| 2   | 0   | 1   | 1      |
| 3   | 1   | 0   | 1      |
| 4   | 1   | 1   | 0      |

Let's think through some of the implications.

1. XOR'ing identical strings return all 0s (#1 & #4)

   - XOR'ing against the same string twice is the same as XOR'ing against all 0s

1. XOR'ing against all 0s return the original string unchanged (#1 & #3 from 1st perspective, #1 & #2 from 2nd perspective)

1. XOR is commutative

   - Observe all four rows of the table above, and note what happens when there is an odd number of 1s and when there is an even number of ones (where zero is even) in the 1st and 2nd bits. Note that when there is an odd number of 1s, the result is 1, when there is an even number of 1s, the result is 0. The order doesn't matter (i.e., it's commutative), just the total number of 1s matters.

The **Hamming Distance** between two strings is how many bits of difference exist between those two string. This can be discovered by doing an XOR and summing the 1s in the result.

## Notes on Cipher Text

Cipher text (or ciphertext) is encrypted text. The original, unencrypted text is plain text (or plaintext). When the plaintext is encrypted it is XOR'd against a key. (The key text can be repeated until it matches the length of the plaintext, so that the plaintext can be fully XOR'd. You can think of plaintext as a secret message and the key as the password.)

Let's observe an interesting fact of ciphertexts. If two pieces of ciphertext were encrypted with the same key, then XOR'ing them will cancel out the keys do to some of the observations we made above. Let `C` be the ciphertext, `P` be the plaintext, `K` be the key, and `x` be the XOR operation.

```
C1 = P1xK
C2 = P2xK
C1xC2 = P1xKxP2xK = P1xP2xKxK (commutativity and KxK is all 0s, which returns the other string.)
=> C1xC2 = P1xP2
```

## Notes on Unicode's UTF-8 & ASCII

English characters are encoded into bytes serially, meaning their bit representations are _very similar_. For example, `a b c = 01100001 01100010 01100011`. From this observation alone, it is hopefully intuitive that XOR'ing two strings of bits that each represent encoded English words will result in a lot more total 0s in the resultant string than when XOR'ing two completely random strings of bits. In fact, doing the math, the probability of a 1 showing up when XOR'ing random bit sequences is around 50%, while the probability of a 1 showing up when XOR'ing two non-random bit sequences encoding English text is around 30%.

## Combining everything together to deduce keys




IMPORTANT!
English character encodings are similar.
A 01000001
w 01110111
e 01100101
s 01110011
o 01101111
m 01101101
e 01100101
! 00100001
I took all pairs above and calculated the average Hamming Distance and/or Average amount of 1s in an XOR:
2.429

Random sequences of bits are not so similar (from Random.org).
00110111
11001100
01010100
11011111
11100100
11110111
00110111
11111001
I took all pairs above and calculated the average Hamming Distance and/or Average amount of 1s in an XOR:
3.821

Conclusion:

WITH CORRECT KEY LENGTH,
(cipher1)XOR(cipher2) = (str1)XOR(str2).
Normalized Hamming Distance, i.e., normalized average amount of 1s in
(cipher1)XOR(cipher2) = (str1)XOR(str2) ~= 2.429 / 8 ~= 0.3

WITH INCORRECT KEY LENGTH,
(cipher1)XOR(cipher2) ~= (rand1)XOR(rand2).
Normalized Hamming Distance, i.e., normalize average amount of 1s in
(rand1)XOR(rand2) ~= 3.821 / 8 ~= 0.5
