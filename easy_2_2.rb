# Array#zip takes two arrays and combines them in alternating order
# Ok to assume array1.size == array2.size

def zip(array_1, array_2)
  output = []
  array_1.each_with_index do |item, idx|
    output << [item, array_2[idx]]
  end
  output
end

p zip([1, 3, 5], [2, 4, 6])