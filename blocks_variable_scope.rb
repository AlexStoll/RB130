# Takes a string, and a block that returns a string
# The method must output the argument followed by a space
# and the value returned by the block

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  # block body
end