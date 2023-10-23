class Solution
  def call(input)
    quick_sort(input, 0, input.length - 1)
  end

  def partition(array, pivot, left, right)
    left_pointer = left
    right_pointer = right - 1 # Excluding the pivot [left, ..., right, pivot]

    while true do
      while array[left_pointer] < pivot
        left_pointer += 1 # Find element that should go to the right of pivot position
      end

      while array[right_pointer] > pivot
        right_pointer -= 1 # Find element that should go to the left of pivot position
      end

      if left_pointer >= right_pointer
        break # The partition is correct, and the pivot is in the correctly sorted position
      else
        array[left_pointer], array[right_pointer] = array[right_pointer], array[left_pointer] # Swap so the elements found are in the correct side of the pivot position
      end
    end
    array[left_pointer], array[right] = array[right], array[left_pointer] # Swap the pivot from the last position to the position where the left_pointer & right pointer meet.
    # If we would have chosen leftmost element as pivot, we would have swapped the pivot with the right_pointer
    left_pointer
  end

  def quick_sort(array, left, right)
    return array if left >= right

    pivot = array[right]
    pivots_correct_position = partition(array, pivot, left, right)
    quick_sort(array, left, pivots_correct_position - 1)
    quick_sort(array, pivots_correct_position + 1, right)
    array
  end
end

p Solution.new.call([5, 1, 6, 2, 3, 4])
