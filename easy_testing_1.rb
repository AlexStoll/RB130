# Minitest assertion that will fail if value.odd? is not true
require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_downcase
    value = 3
    assert(value.odd?)
  end
end
