# Fails if list != list.process

require 'minitest/autorun'

class List
  def process
    self
  end
end

class Testing < MiniTest::Test
  def test_process
    list = List.new
    assert_equal(list, list.process)
  end
end