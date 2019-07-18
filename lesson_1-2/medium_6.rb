# A lone & applied to an object has ruby try to convert
# the object to a block.
# If that object is a proc, the conversion just happens
# If it's not a proc, to_proc is called
#   &:to_s => Proc.new({|x| x.to_x}) => {|x| x.to_s}
# & operator can be applied to methods
# Method#to_proc or &method

# Convert an array of integers to base 8 numbers.

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
