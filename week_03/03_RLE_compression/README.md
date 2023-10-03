# Week 3 .

### Title: RLE compression

### Problem statement
Write a program in Ruby that implements Run Length Encoding (RLE) compression algorithm. It is a lossless compression algorithm

For example, given an input, we should be able to compress it into the output shown and extact the original input from the output again.
```ruby 
input = "aaaaaabbbbzzzz"
output = "a6b4z4"
```
### Comments/Description/Learnings
https://en.wikipedia.org/wiki/Run-length_encoding


Try to use string scanner class

My implementation will fail for more than 10 digits,
ALSO OUTPUT ANYTHING LEFT IN STACK
