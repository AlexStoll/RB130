# Enumerable#drop_while iterates over the members of a collection
# passing in each element to the block - until it finds an element
# for which the block returns false or nil. It then returns an array
# of remaining elements and the current element.

def drop_while(array)
  array.each { |item| return array[array.index(item)..-1] if !yield(item) }
  []
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []