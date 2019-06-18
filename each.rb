# each.rb
# [1, 2, 3].each { |num| puts num}

# My solution
def each(array)
  counter = 0
  until counter == array.size do
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3]) {|num| puts num}

# LS solution
def each(array)
  counter = 0
  while counter < array.size do
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3]) {|num| puts num}
