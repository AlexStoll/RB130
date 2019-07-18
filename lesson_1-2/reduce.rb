# reduce.rb
# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end

# a = [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end

# added challenge, getting it to work with non-numbers
def reduce(array, default=array[0])
  acc = default
  if default == array[0]
    array[1..-1].each { |n| acc = yield(acc, n) }
  else
    array.each { |n| acc = yield(acc, n) }
  end
  acc
end

array = [1, 2, 3, 4, 5]

a = reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p a
b = reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p b
