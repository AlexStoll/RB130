# Return a list of all of the divisors
# of the positive integer passed in as an argument
# Return them in any order

# def divisors(num)
#   1.upto(num).select { |x| x if (num % x == 0) }
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors(num)
  start = Time.now
  result = []
  1.upto(num) do |n|
    break if result.include?(n)
    if num % n == 0
      result << n
      result << (num / n)
    end
  end
  output = result.uniq.sort
  finish = Time.now
  p finish - start
  output
end

p divisors(999962000357)
p divisors2(999962000357)
