# text_test.rb

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    document = Text.new(@file.read)
    actual_return = document.swap('a', 'ANIMALS')
    correct_return = <<~HEREDOC.chomp
    Lorem ipsum dolor sit ANIMALSmet, consectetur ANIMALSdipiscing elit. CrANIMALSs sed vulputANIMALSte ipsum.
    Suspendisse commodo sem ANIMALSrcu. Donec ANIMALS nisi elit. NullANIMALSm eget nisi commodo, volutpANIMALSt
    quANIMALSm ANIMALS, viverrANIMALS mANIMALSuris. Nunc viverrANIMALS sed mANIMALSssANIMALS ANIMALS condimentum. Suspendisse ornANIMALSre justo
    nullANIMALS, sit ANIMALSmet mollis eros sollicitudin et. EtiANIMALSm mANIMALSximus molestie eros, sit ANIMALSmet dictum
    dolor ornANIMALSre bibendum. Morbi ut mANIMALSssANIMALS nec lorem tincidunt elementum vitANIMALSe id mANIMALSgnANIMALS. CrANIMALSs
    et vANIMALSrius mANIMALSuris, ANIMALSt phANIMALSretrANIMALS mi.
    HEREDOC

    assert_equal(correct_return, actual_return)
  end

  def test_word_count
    assert_equal(72, Text.new(@file.read).word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end