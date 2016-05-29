require 'benchmark'
# Not in place
def move_zeros(array)
  new_array = []
  array.each do |n|
    if n != 0
      new_array << n
    end
  end
  (array.length - new_array.length).times { new_array << 0 }
  new_array
end

# In place
def move_zeros_in_place(array)
  length = array.length
  pointer = 0
  array.each do |i|
    if i != 0 
      array[pointer] = i
      pointer += 1
    end
  end
  until pointer == length 
    array[pointer] = 0
    pointer += 1
  end
  array 
end

nums1 = (1..1000000).map { (rand * 10).round }

puts 'CPU time, System CPU time, Sum CPU time, (  Real Time)'
puts 'move_zeros:'
puts Benchmark.measure { move_zeros(nums1) }
puts 'move_zeros_in_place:'
puts Benchmark.measure { move_zeros_in_place(nums1) }


# describe 'move_zeros' do
#   it 'properly handles [0]' do
#     expect(move_zeros([0])).to eq([0])
#   end
#   it 'properly handles [0, 1]' do
#     expect(move_zeros([0, 1])).to eq([1, 0])
#   end  
#   it 'properly handles a longer array' do
#     expect(move_zeros([0, 1, 4, 4, 2, 0, 0, 2, 5, 1, 5, 6, 7, 0, 0, 1, 0, 2])).to eq([1,4, 4, 2, 2, 5, 1, 5, 6, 7, 1, 2, 0, 0, 0, 0, 0, 0])
#   end
# end