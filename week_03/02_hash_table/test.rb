require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_hash_table
    ht = HashTable.new
    ht.set(1005, 1)
    ht.set(2005, 2)
    ht.set(3005, 3)
    ht.set(4005, 4)
    ht.set(1007, 7)
    ht.delete(4005)

    assert_equal(2, ht.get(2005))
    assert_equal(nil, ht.get(1))
    assert_equal(7, ht.get(1007))
    assert_equal([[[1005, 1], [2005, 2], [3005, 3]], [[1007, 7]]], ht.print)
  end
end
