# max_by
# Enumerable#max_by iterates over a collection
# passes each element to the block
# It returns the element for which the block returned the largest value

def max_by(array)
  max = array[0]
  array.each do |item|
    max = item if yield(item) > yield(max)
  end
  max
end

p max_by([6, 5, 3]) { |value| value + 2 } == 6
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil