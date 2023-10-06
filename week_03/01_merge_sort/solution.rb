def merge_sort(array)
  if array.length > 1
    mid = array.length / 2
    puts "left"
    p left = array[0...mid]
    puts "right"
    p right = array[mid..(array.length - 1)]
    puts ""
    merge_sort(left)
    merge_sort(right)

    i = j = k = 0

    while i < left.length && j < right.length
      if left[i] <= right[j]
        array[k] = left[i]
        i += 1
      else
        array[k] = right[j]
        j += 1
      end
      k += 1
    end

    while i < left.length
      array[k] = left[i]
      i += 1
      k += 1
    end

    while j < right.length
      array[k] = right[j]
      j += 1
      k += 1
    end
  end
  array
end
puts merge_sort([21, 43, 73, 8, 15]).inspect
puts [21, 43, 73, 8, 15].sort.inspect
