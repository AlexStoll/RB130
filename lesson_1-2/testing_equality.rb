require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"
    str3 = 'h'

    assert_equal(str1, str2) # uses the class's == method
    assert_same(str1, str2) # method will return upon the first failed assertion
  end
end
