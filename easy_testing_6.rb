require 'minitest/autorun'

class NoExperienceError < StandardError; end

class HR
  def hire
    raise NoExperienceError unless self.cool?
  end

  def cool?
    false
  end
end

class Testing < MiniTest::Test
  def test_downcase
    employee = HR.new
    assert_raises(NoExperienceError) {employee.hire}
  end
end
