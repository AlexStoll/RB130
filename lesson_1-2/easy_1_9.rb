# one?
# Returns true if the block returns true for only one item

def one?(array)
  truths = 0
  array.each do |item|
    truths += 1 if yield(item)
    return false if truths > 1
  end
  truths == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    ==  true
p one?([1, 3, 5, 7]) { |value| value.odd? }     ==  false
p one?([2, 4, 6, 8]) { |value| value.even? }    ==  false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } ==  true
p one?([1, 3, 5, 7]) { |value| true }           ==  false
p one?([1, 3, 5, 7]) { |value| false }          ==  false
p one?([]) { |value| true }                     ==  false