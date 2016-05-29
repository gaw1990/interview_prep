require 'benchmark'

# Solution 1 (Naive)
def naive_intersection(nums1, nums2)
  array = []
  nums1.each do |outer|
    nums2.each do |inner| 
      if outer == inner && !array.include?(inner)
        array << inner
      end
    end
  end
  array
end

# Solution 2, O(unique_outer_N * unqiue_inner_N)
def cache_intersection(nums1, nums2)
  array = []
  outer_cache = {}
  inner_cache = {}
  nums1.each do |outer|
    next if outer_cache[outer]
    outer_cache[outer] = true
    nums2.each do |inner| 
      next if inner_cache[inner]
      if outer == inner 
        array << inner
        inner_cache[inner] = true
      end
    end
  end
  array
end

# Solution 3, O(unique_outer_N + unqiue_inner_N)
def cache_intersection2(nums1, nums2)
  outer_cache = {}
  nums1.each do |n|
    next if outer_cache[n]
    outer_cache[n] = true
  end
  array = []
  inner_cache = {}
  nums2.each do |n|
    next if inner_cache[n]
    array << n if outer_cache[n]
    inner_cache[n] = true
  end
  array
end



nums1 = (1..10000).map { rand }
nums2 = (1..10000).map { rand }

puts 'CPU time, System CPU time, Sum CPU time, (  Real Time)'
puts 'Naive:'
puts Benchmark.measure { naive_intersection(nums1, nums2) }
puts 'Cached1:'
puts Benchmark.measure { cache_intersection(nums1, nums2) }
puts 'Cached2:'
puts Benchmark.measure { cache_intersection2(nums1, nums2) }

# describe 'intersection' do 
#   it 'returns the intersection of two one element arrays' do 
#     expect(intersection([1], [1])).to eq([1])
#   end
#   it 'returns the intersection of two arrays' do 
#     expect(intersection([1, 2, 2, 1], [2, 2])).to eq([2])
#   end
# end