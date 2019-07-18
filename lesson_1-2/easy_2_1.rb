# Range#step lets you iterate over values where each value
# is the previous value plus the 'step' size
# step(1, 10, 3) "Step from 1 to 10 by 3" => 1, 4, 7, 10

def step(min, max, step_size)
  current = min
  until current > max do
    yield(current)
    current += step_size
  end
  # either return the last block return, the last value, or nil
  nil
end

p step(1, 10, 3) { |num| puts num}
