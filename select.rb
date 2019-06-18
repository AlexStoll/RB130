# select.rb
# If the block evaluates to true, add the item to the return array

def select(array)
  counter = 0
  result = []
  until counter == array.size do
    result << array[counter] if yield(array[counter])
    counter += 1
  end
  result
end

array = [1, 2, 3, 4, 5]
p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }

# Tricky solution using each
# def select(array)
#   output = []
#   array.each { |item| output << item if yield(item)}
# end