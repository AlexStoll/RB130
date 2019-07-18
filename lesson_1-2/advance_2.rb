# Arity of lambdas, procs, and blocks.
# Write down observations for each group of code.
# Explain the differences between procs, blocks, and lambdas.


# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}."}
# puts my_proc
# # => Proc object
# puts my_proc.class
# # => Proc
# my_proc.call
# # => "This is a ." Runs code even without an argument given.
# my_proc.call('cat')
# # => "This is a cat." Runs code and uses the supplied argument.
# my_proc.call('cat', 'dog')
# # => "This is a cat." Uses first argument, ignores second.

# Procs seem to have totally lenient arity rules. #



# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}."}
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# # => A lamda Proc object was created..
# puts my_second_lambda
# # => Another lamda Proc object. Lambdas must be a type of Proc.
# puts my_lambda.class
# # => Yup. Lambdas are a type of Proc.
# my_lambda.call('dog', 'cat')
# # => 'This is a dog.' Accepts the argument and assigns it to `thing` within the block.
# # my_lambda.call
# # => ArgumentError. Arity more strict and will not run unless an argument is given.
# my_second_lambda.call('cat')
# # => 'This is a cat.' Seems to assign the argument to `thing` in the same way.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# # => Lambda is NOT a class, thus `Lambda.new` is not valid.



# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# => Yields to the block, but argument not passed to yield, so `seal` is nil.
# block_method_1('seal')
# => Does not run, no block passed in.

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# => 'This is a turtle.' Works as expected, 'turtle' assigned to turtle within the block, thanks to yield(animal).
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# => turtle assigned to 'turtle', seal is assigned to nil because an argument is not supllied.
block_method_2('turtle') { puts "This is a #{animal}." }
# => animal is undefined within the block because nothing was assigned to it as a block local variable { |like_this| }




