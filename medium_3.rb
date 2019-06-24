# Modify so that the output of items is moved to a block
# It's implementation is up to the user of the gather method


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) {puts items.join.chars.shuffle.join.upcase}