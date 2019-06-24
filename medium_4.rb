# Write a method that takes an array as an argument
# Method yields the contents of the array to a block
# assigns block variables in such a way that it ignores
# the two first elements, and groups all remaining elements
# as a raptors array

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield(birds)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
  end