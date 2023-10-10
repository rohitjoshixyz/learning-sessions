class Solution
  def call(array)
    stack = []
    array.each do |element|
      if element.is_a?(Integer)
        stack.push(element)
      else
        a = stack.pop
        b = stack.pop
        result = b.send(element, a)
        stack.push(result)
      end
    end
    stack[0]
  end
end
