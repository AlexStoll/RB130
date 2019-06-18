# All methods take blocks

# def hello
#   "hello!"
# end

# hello { puts 'hi' }

# Every method can take an optional block as an implicit parameter

def echo(str)
  str
end

# p echo("hello!")
# p echo("hello!") { puts "world"}
# No sign of this block being passed, yet no error.

def echo_with_yield(str)
  yield # Executes a block when present
  str
end

# echo_with_yield("hello!") { puts "world" }
# p echo_with_yield("hello!") # LocalJumpError

def echo_with_yield_optional(str)
  yield if block_given?
  str
end

# echo_with_yield_optional("hello!") # block optional due to conditional
# echo_with_yeild_optional("hello!") { puts "world" }

def say(words)
  yield if block_given?
  puts "> " + words
end

# say("hi there") do
#   system 'clear'
# end

def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# increment(5) do |num|
#   puts num
# end

# passing wrong number of arguments to a block

def test
  yield(1, 2) # passing 2 block args
end

# test { |num| puts num } # expeciting just 1 parameter

def test
  yield(1) # passing 1 block arg
end

# test do |num1, num2|
#   puts "#{num1} #{num2}" # expecting 2 paramters
# end

# num2 is set to `nil` in lieu of being passed an argument

# compare('hi') { |word| word.upcase } want this method
# => Before: hi
# => After: HI

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# compare('hello') { |word| word.upcase}

# Without using blocks
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          # etc, we could have a lot of 'when' clauses
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

# compare("hello", :capitalize)
# Before: hello
# After: HELLO
# => nil

# The above method allows the caller to choose which flag they want
# Still restricted, and MUST pick a flag

# With a block
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end
# compare('hello') { |word| word.upcase}

# This is the same method, but written to accept a block
# It gives the caller freedom to apply whatever changes they want
# to `str`, not just :upcase or :capitalize

# sandwhich methods
def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds"
end

# time_it {100_000_000.times {|i| i}}

my_file = File.open("some_file.txt", "w+") do |file|
  file.write('Added this text from the method')
end
# The `File#open` method is a sandwhich method
# It opens the file, runs the block, then closes the file

# Explicit blocks, this allows for referencing the block in the method
def test(&block) # converts the argument to a "simple" Proc object
  puts "What's &block? It's #{block}" # can be called anything
end

# test { sleep(1)} # It's a proc object!

# These explicit blocks give you a handle for the block within
# the method, this means you can call it on certain objects, you
# don't have to use yield, and you can pass it into other methods.

def test2(block)
  puts "hello"
  block.call                    # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

# test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2

def example(&block)
  block # doesn't run
  puts "Do something else"
  block.call # need this to run 
             # because 'block' has been
             # converted to a Proc object
  puts "another thing"
end

example { puts "xyz" }





