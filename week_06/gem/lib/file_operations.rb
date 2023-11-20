module FileOperations
  def write_file_with_tree(serialized_tree, encoded_string)
    File.open("output.hzip", "wb") do |file|
      binary_form_of_tree = serialized_tree.unpack("B*").first
      file.write([binary_form_of_tree.length].pack("N"))
      file.write(binary_form_of_tree)
      file.write(encoded_string)
    end
  end

  def read_file_with_tree(file_path)
    file = File.open(file_path, "rb")
    size = file.read(4).unpack("N")[0]
    binary_form_of_tree = file.read(size)
    serialized_tree = [binary_form_of_tree].pack("B*")
    encoded_string = file.read
    [serialized_tree, encoded_string]
  end
end
