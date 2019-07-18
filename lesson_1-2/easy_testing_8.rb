# Will fail if 'value' is not an instance of exactly 'Numeric'
require 'minitest/autorun'


class Testing < MiniTest::Test
  def test_numeric
    assert_kind_of(Numeric, 5.5)
  end
end