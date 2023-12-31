# Week 6

### Title: Huffman encoding

### Problem statement

- Implement Huffman coding / decoding (it uses priority queue and binary search trees):
  - Do it as a real project, combine what you have learned so far
  - One binary (Ruby script) with command line attributes to specify input/output files and mode (encode/decode)
  - Display help
  - Add automatic tests
  - Add documentation (README.md)
  - Do manual testing with some big files, verify encoding and decoding producing the original work
  - Try to benchmark the code (benchmark-ips, stackprof, tracking object allocations etc) and try to optimize it

### Comments/Description/Learnings
https://www.geeksforgeeks.org/huffman-coding-greedy-algo-3/

https://www.scaler.com/topics/huffman-coding/

Creating a Ruby executable
https://dev.to/jvon1904/how-to-create-a-ruby-executable-j70

https://nts.strzibny.name/making-a-ruby-executable-with-ruby-packer

https://www.rubyguides.com/2018/12/ruby-argv/


# Try Marshal, try preorder traversal and reconstruct the tree
4 bytes would be the size of the tree
Then parse the next size bytes for the tree
Remaining byte would be the payload

https://docs.fileformat.com/image/png/ magic header

https://www.geeksforgeeks.org/serialize-deserialize-binary-tree/
