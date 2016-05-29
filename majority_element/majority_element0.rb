require 'benchmark'

# Solution 1 (Naive garbage)
def majority_element(array)
  cache = {}
  array.each do |i|
    if cache[i] 
      cache[i] += 1
    else
      cache[i] = 1
    end
  end
  winner = nil
  array.each do |i|
    winner = i if !winner
    if cache[i] >= cache[winner]
      winner = i
    end
  end
  winner
end

# solution 2 (let's go for O(N)!!!)
def majority_element2(array)
  candidate = nil
  count = 0
  array.each do |x|
    if x != candidate
      count -= 1
    else
      count += 1
    end
    if count <= 0 
      candidate = x
      count = 1
    end
  end
  candidate
end

# solution 2a, slightly less sloppy
def majority_element2a(array)
  candidate = nil
  count = 0
  array.each do |x|
    if x != candidate
      count -= 1
      if count <= 0
        candidate = x
        count = 1
      end
    else
      count += 1
    end
  end
  candidate
end



nums1 = (1..9999999).map { (rand * 10).round }

Benchmark.bm do |x|
  x.report("majority_element:") { majority_element(nums1) }
  x.report("majority_element2:") { majority_element2(nums1) }
  x.report("majority_element2a:") { majority_element2a(nums1) }
end 






describe 'majority_element' do 
  it 'returns the majority element for a one element array' do
    expect(majority_element([1])).to eq(1)
  end
  it 'returns the majority element for a three element array' do
    expect(majority_element([1, 2, 2])).to eq(2)
  end  
  it 'returns the majority element for a multi element array' do
    expect(majority_element([1, 2, 2, 5, 7, 3, 2, 1, 1, 7, 8, 999, 2])).to eq(2)
  end
end

describe 'majority_element2' do 
  it 'returns the majority element for a one element array' do
    expect(majority_element2([1])).to eq(1)
  end
  it 'returns the majority element for a three element array' do
    expect(majority_element2([1, 2, 2])).to eq(2)
  end  
  it 'returns the majority element for a multi element array' do
    expect(majority_element2([1, 2, 2, 5, 7, 3, 2, 1, 1, 7, 8, 999, 2])).to eq(2)
  end
end

describe 'majority_element2a' do 
  it 'returns the majority element for a one element array' do
    expect(majority_element2a([1])).to eq(1)
  end
  it 'returns the majority element for a three element array' do
    expect(majority_element2a([1, 2, 2])).to eq(2)
  end  
  it 'returns the majority element for a multi element array' do
    expect(majority_element2a([1, 2, 2, 5, 7, 3, 2, 1, 1, 7, 8, 999, 2])).to eq(2)
  end
end