# Write a method that takes an optional block
# If block spec'd, method executes and returns block return
# If no block, method should return 'Does not compute'

def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further - allow compute to take an argument, and yield it to the block
# Provide examples of calling this method, including a no-block call

def compute_with_arg(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute_with_arg(5) { |x| x ** 2 }
p compute_with_arg('wut') { |x| x + '?'}
p compute_with_arg('Not used')