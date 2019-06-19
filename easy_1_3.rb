# Take a sorted array of integers as an argument
# Return an array that includes all the missing integers
# [1, 2, 3, 4] => []
# [0, 3, 4, 6] => [1, 2, 5]

# def missing(arr)
#   (arr[0]..arr[-1]).to_a - arr
# end



def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)...(second)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []