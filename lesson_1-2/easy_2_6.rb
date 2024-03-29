# each_with_index
# Iterates over the collection, passing each element and its index
# Value returned is not used
# Returns a reference to the original collection

def each_with_index(array)
  idx = 0
  array.each do |item|
    yield(item, idx)
    idx += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]


