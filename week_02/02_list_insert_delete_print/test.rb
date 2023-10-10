require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @list = List.new
  end

  def test_insert_and_print
    @list.insert(5)
    @list.insert(6)
    @list.insert(7)
    assert_equal [5, 6, 7], @list.print
  end

  def test_delete_and_print
    @list.insert(5)
    @list.insert(6)
    @list.insert(7)
    @list.delete(6)
    assert_equal [5, 7], @list.print
  end

  def test_delete_and_print_when_empty
    @list.delete(6)
    assert_equal [], @list.print
  end

  def test_delete_and_print_when_one_element
    @list.insert(5)
    @list.delete(5)
    assert_equal [], @list.print
  end
end
