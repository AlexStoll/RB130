# Internal vs External Iterators

# map or each use something called "Internal Iteration"
# called that because the process and implementation
# is hidden from us.

# "External Iteration" is controlled by the user.
# This is possible in the enumerator class.

# Create a new Enumerator Object
# => Define what values are iterated upon
# => Iterate over an infinite list of factorals
# => Test the new Enumerator by printing out fact(0) to fact(6)

# use Enumerator::new for help
# use top of documentation
# use wiki for factorials 

# only need 3 Enumerator methods
# Enumerator implements the Enumerable module as well
# => use those methods too

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorial.next }

# factorial.each_with_index do |number, index|
#   puts number
#   break if index == 6
# end




