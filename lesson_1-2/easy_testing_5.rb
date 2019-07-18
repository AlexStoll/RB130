# Write assertion that will fail if 'xyz' is not in the array 'list'

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_downcase
    list = ['xyz', 3, {}]
    assert_includes(list, 'xyz')
  end
end
