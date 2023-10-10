class Solution
  def non_recursive_binary_search(array, key)
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

  def recursive_binary_search(array, key, low, high)
    return -1 if low > high
    mid = (low + high) / 2
    if array[mid] == key
      mid
    elsif key < array[mid]
      recursive_binary_search(array, key, low, mid - 1)
    else
      recursive_binary_search(array, key, mid + 1, high)
    end
  end

  def call_recursive_binary_search(array, key)
    recursive_binary_search(array, key, 0, array.length - 1)
  end
end
