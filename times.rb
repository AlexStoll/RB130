# 5.times do |num|
#   puts num
# end

# times(5) do |num|
#   puts num
# end

# My solution (which I nailed)
# def times(number)
#   0.upto(number - 1) do |n|
#     yield(n)
#   end
#
#   number
# end

# Given solution
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number # or counter, they'll be the same
end

times(5) do |num|
  puts num
end