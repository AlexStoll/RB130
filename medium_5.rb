items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# fill out the method calls for gather so they produce
# the output shown below

# 1
# gather(items) do |*first, last|
#   puts first.join(', ')
#   puts last
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2

# gather(items) do |first, *middle, last|
#   puts first
#   puts middle.join(', ')
#   puts last
# end

# # Let's start gathering food.
# # apples
# # corn, cabbage
# # wheat
# # We've finished gathering!

# # 3

gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end

# # Let's start gathering food.
# # apples
# # corn, cabbage, wheat
# # We've finished gathering!

# # 4

gather(items) do |first, second, third, forth|
  puts [first, second, third, forth].join(', ')
end

# # Let's start gathering food.
# # apples, corn, cabbage, and wheat
# # We've finished gathering!
