module FileOperations
  def write_file_with_tree(serialized_tree, encoded_string)
    File.open("compressed.hzip", "wb") do |file|
      base64_tree = [serialized_tree].pack("m")
      length = base64_tree.length
      file.write([length].pack("N"))
      file.write(base64_tree)
      file.write([encoded_string].pack("B*"))
    end
  end

  def read_file_with_tree(file_path)
    file = File.open(file_path, "rb")
    size = file.read(4).unpack("N")[0]
    serialized_tree = file.read(size).unpack("m").first
    # p serialized_tree
    encoded_string = file.read.unpack("B*").first

    [serialized_tree, encoded_string]
  end
end
