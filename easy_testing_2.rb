require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_downcase
    value = "XYZ"
    assert_equal('xyz', value.downcase)
  end
end
