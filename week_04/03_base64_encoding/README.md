# Week 4

### Title: Cookie Parser

### Problem statement
Write a program in Ruby that encodes and decodes in Base64 representation of text

### Comments/Description/Learnings
https://www.lifewire.com/base64-encoding-overview-1166412

Take 3 bytes of binary data (that's 24 bits).
Split those 24 bits into 4 chunks of 6 bits each.
Convert each 6-bit chunk into an index.
Use the index to look up a character in the Base64 alphabet (which contains 64 characters: A-Z, a-z, 0-9, +, /).

Let's encode the word "Man" in Base64:

Take the ASCII values:
M = 77 = 01001101
a = 97 = 01100001
n = 110 = 01101110

Combine them:
01001101 01100001 01101110

Split into 6-bit chunks:
010011 010110 000101 101110

Convert to decimal: 19, 22, 5, 46

Using the Base64 index table:
19 -> T
22 -> W
5 -> F
46 -> u

So, the Base64 encoding of "Man" is "TWFu"
