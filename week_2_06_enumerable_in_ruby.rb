module MyEnumerable
  def my_include?(array, value)
    return unless array.is_a?(Array)

    array.reduce(false) do |result, element|
      result ||= (element == value)
    end
  end

  # https://ruby-doc.org/3.2.2/Enumerable.html#method-i-all-3F
  def my_all?(array, value = nil, &block)
    if block_given?
      !!array.reduce(true) do |result, element|
        result &&= block.call(element)
        result
      end
    elsif value == nil
      !!array.reduce(true) do |result, element|
        result && element
      end
    elsif value.is_a?(Regexp)
      !!array.reduce(true) do |result, element|
        result &&= value.match(element)
        result
      end
    end
  end

  def my_sum(array)
    array.reduce do |result, element|
      result += element
    end
  end

  def my_each(array, &block)
  end
end
include MyEnumerable
puts my_all?([1, 2, false])
puts my_all?([3, 4, 5]) do |e|
  puts "e is #{e}"
  e > 7
end
