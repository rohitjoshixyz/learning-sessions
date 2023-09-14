module MyEnumerable
  def my_include?(array, value)
    return unless array.is_a?(Array)

    array.reduce(false) do |result, element|
      result ||= (element == value)
    end
  end

  def my_all?(array, value, &block)
    if [true, false].my_include?(value)
      array.reduce{|result, element|  }
    elsif value.is_a?(Regexp)
    
    elsif block_given?

    end

    array.reduce(true) do |result, element|
      result &&= (element == value)
    end
  end
end

def my_sum(array)
  array.reduce do |result, element|
    result += element 
  end
end
