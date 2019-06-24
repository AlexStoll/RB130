# text.rb

class Text
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

script = Text.new(File.read('sample_text.txt'))
puts script.word_count