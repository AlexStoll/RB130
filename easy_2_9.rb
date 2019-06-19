# Enumerable#each_cons iterates over the collection
# taking each sequence of n consecutive elements at a time
# and passing them to the associated block
# then returns nil

# Write an each_cons that takes 2 elements at a time

# My solution, it's halfway to working for any 'size'
# def each_cons(array, size=2)
#   idx = 0
#   array.each do |item|
#     yield(item, array[idx + (size - 1)])
#     idx += 1
#     break if idx + (size - 1) >= array.size
#   end
#   nil
# end

def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil


hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil