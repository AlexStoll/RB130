# Write a minitest assertion that will fail if value is not nil

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_nil
    value = nil
    assert_equal(nil, value)
  end

  def test_nil_2
    value = nil
    assert_nil(value)
  end
end
