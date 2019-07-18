# Will fail if 'xyz' is one of the elements in the array 'list'
require 'minitest/autorun'


class Testing < MiniTest::Test
  def test_numeric
    list = [1, 2, 3, 'a']
    refute_includes(list, 'xyz')
  end
end