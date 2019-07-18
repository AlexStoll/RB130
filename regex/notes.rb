text = 'abcdefgho elephant? house ABCDEFG'

# single letter matching
text.gsub(/a/, 'WOW')
# case insensitive matching
text.gsub(/a/i, 'OOOH')

# escaping special characters
text.gsub(/\?/, '123')

# can concatenate multiple patterns of single letters
text.gsub(/ho/, 'OO')

other = "cat, dog, elephant, dog, cat"

# using the pipe ( | ) to 'alternate' multiple patterns
other.gsub(/cat|dog|elephant/, '123') # extra () optional

# using \s \n and \t for spaces, newlines, and tabs
"has space" if " ".match(/\s/)
"has new line" if "
                     ".match(/\n/)

strings = %w[blueberry blackberry black berry strawberry]
strings.each do |word|
  word if word.match(/(blue|black)berry/)
end

# ANCHORS
# word boundary - \b (non word boundary /B)
# start and end of a string - \A \z (\Z excludes final newline)
# start and end of a line - ^ $

# QUANTIFIERS
# zero or more  *, /ba*t/ matches 'bt' 'bat' 'baat' etc
# one or more   +, /ba+t/ matches 'bat' 'baat', but not 'bt'
# zero or one   ?, /ba?t/ matches 'bt' 'bat' but not 'baat'

# COUNTS {}
# g{m} exactly 'm' of g => /o{2}/ matches 'google'
# g{m,} m or more of g  => /o{2,/ matches 'gooogle'
# g{m, n} m to n of g   => /0{1, 2} doesn't match 'gooogle' or 'ggle'


text = "<h1>Main Heading</h1>"
p text.gsub(/<h1>.*<\/h1>/, '~')

