# Write minitest that will fail if the Array 'list' is not empty

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_list_empty
    list = []
    assert_equal(true, list.empty?)
  end

  def test_list_empty_2
    list = []
    assert_empty(list)
  end
end
