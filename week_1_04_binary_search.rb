def binary_search(array, key)
  low = 0
  high = array.length - 1
  while low <= high do
    mid = (low + high) / 2
    puts "low #{low}, mid #{mid}, high #{high}"
    if array[mid] == key
      return mid
    elsif key < array[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
  -1
end
binary_search([1, 2, 4, 5, 7, 9, 10], 10)


def binary_search(array, key, low, high)
  return -1 if low > high
  mid = (low + high) / 2
  puts "low #{low}, mid #{mid}, high #{high}"
  if array[mid] == key
    mid
  elsif key < array[mid]
    binary_search(array, key, low, mid - 1)
  else
    binary_search(array, key, mid + 1, high)
  end
end
binary_search([1, 2, 4, 5, 7, 9], 9, 0, 5)

def call_binary_search(array, key)
  binary_search(array, key, 0, array.length - 1)
end
call_binary_search([1, 2, 4, 5, 7, 9], 9)

# Always add all types of test cases

