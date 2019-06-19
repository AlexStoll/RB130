Things I won’t remember from RB130

* blocks are passed into methods as arguments
* the ‘method implementation’ decides what to actually do with a block once it’s passed in
    * for example, the method could return the calling object
    * the method could return the result of the block
    * the method could return a new object that results from using the code in the blocks
Yield
* If used without conditional in a method, block must be passed when invoking, else LocalJumpError
* Use `Kernel#block_given?` to make a block optional via a conditional
* can think of blocks as ‘anonymous’ methods

do |num|  puts num
end

Within the above block, `num` is a block local variable - a special subset of local variables

The rules around enforcing the number of arguments you can call on a closure in Ruby is called its arity.
* blocks have lenient arity rules
    * they don’t enforce argument count, in contrast to normal Ruby methods
* props and lambdas have different arity rules


When to use blocks in your own methods

1. Defer some implementation code to method invocation
    1. Two roles in any method: method implementor and method caller (talking people here)
    2. Implementor doesn’t always know how the caller will use the method
    3. Blocks allow the implementor to give the caller some freedom to customize the method at time of use
    4. The Array#select method is a great example, it allows you to pass a block to select for whatever attribute you want, rather than something narrow like Array#select_odds
    5. Do this when you notice the same method being called in multiple places, but with a little tweak in each call
2. Methods that need to perform ‘before and after’ actions
    1. This is called sandwich code: before, run block, after
    2. Good for: Timing, logging, notification system

Summary of Blocks 
* Blocks are one way that Ruby implements closures
    * closures are a way to pass around an unnamed “chunk of code” for later use
* Blocks can take arguments, like normal methods
    * Unlike normal methods, they won’t complain about the wrong number of arguments being passed to them
* Blocks return a value, like methods
* Blocks are good for deferring some implementation decisions to be made at time of invocation.
    * Allows the method caller to refine the method for specific use cases.
    * Allows the implementor to build a more generic, broadly useful method.
* Blocks are great for ‘sandwich code’. Do something, run the block, do something that changed as a result of the block.
    * Or - open something, change it with the block, close that thing

So in other words, Symbol#to_proc will return a Proc, which the & will then turn into a block, which turns our shortcut into the long form block usage.

Lesson 1 Summary:
* blocks, Procs, and lambdas are types of closures in Ruby (methods too… shhh)
* closures bring their context/environment with them, which is at the core of variable scoping in Ruby
* blocks are great for allowing the caller to finish implementing a method to their specifications
* blocks are great for wrapping logic, before/after actions
* can write methods that take a block with the yield keyword
* when yielding, we can pass arguments to the block
* when yielding, keep the block’s return value in mind
* Ruby core library methods are easily custom made from scratch in our own classes using blocks
* Symbol#to_proc is a nice shortcut with a complex background
* 

