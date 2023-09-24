matrix = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [44, 55, 66, 77]
]

# 1 5 44
# 2 6 55
# 3 7 66
# 4 8 77

rows = matrix.length # 2
cols = matrix.first.length # 4

output = Array.new(cols) do
  Array.new(rows)
end

matrix.each_with_index do |row, row_index|
  row.each_with_index do |_, elem_index|
    output[elem_index][row_index] = matrix[row_index][elem_index]
  end
end
puts output.inspect

# def my_transpose(matrix)
#   new_matrix = []
#   i = 0
#   while i < matrix[0].size # this will create correct number of rows
#     new_matrix[i] = []
#     j = 0
#     while j < matrix.size
#       new_matrix[i] << matrix[j][i]
#       j += 1
#     end
#     i += 1
#   end
#   return new_matrix
# end
