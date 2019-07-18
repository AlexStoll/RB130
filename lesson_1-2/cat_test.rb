# cat_test.rb
require 'minitest/autorun'
require_relative 'cat.rb'
require 'minitest/reporters'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 5)
  end

  def test_is_cat; end

  def test_name
    assert_equal('Kitty', @kitty.name)
  end

  def test_miaow
    assert_includes(@kitty.miaow, ' is miaowing.')
  end

  def test_raises_error
    assert_raises(ArgumentError) { Cat.new('cat', 2) }
  end

  def test_is_not_purrier
    skip
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)

    refute(patch.purr_factor > milo.purr_factor)
  end
end
