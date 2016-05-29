require 'benchmark'
# Solution 1 (Naive w/ ruby magic)
def valid_anagram?(string1, string2)
  string1.split('').sort == string2.split('').sort
end


# Solution 2 (with ASCII magic ;) ) 
def valid_anagram_ascii_array?(s1, s2)
  ascii_array = []
  180.times { ascii_array << 0 }
  s1.each_char do |c|
    ascii_array[c.ord] += 1
  end
  s2.each_char do |c|
    ascii_array[c.ord] -= 1
  end
  ascii_array.each do |a|
    return false if a != 0
  end
  true
end

# Solution 3 (with ASCII magic ;) ) 
def valid_anagram_ascii_array_single_loop?(s1, s2)
  ascii_array = []
  180.times { ascii_array << 0 }
  return false if s1.length != s2.length
  s1.length.times do |i|
    ascii_array[s1[i].ord] += 1
    ascii_array[s2[i].ord] -= 1
  end
  ascii_array.each do |a|
    return false if a != 0
  end
  true
end

o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
string1 = (0...9999999).map { o[rand(o.length)] }.join
string2 = (0...9999999).map { o[rand(o.length)] }.join

Benchmark.bm do |x|
  x.report("valid_anagram?:") { valid_anagram?(string1, string2) }
  x.report("valid_anagram_ascii_array?:") { valid_anagram_ascii_array?(string1, string2) } 
  x.report("valid_anagram_ascii_array_single_loop?:") { valid_anagram_ascii_array_single_loop?(string1, string2) } 
end 



describe 'valid_anagram?' do 
  it 'returns true for two equal one letter strings' do 
    expect(valid_anagram?("t", "t")).to eq(true)
  end  
  it 'returns false for two non-equal one letter strings' do 
    expect(valid_anagram?("t", "s")).to eq(false)
  end  
  it 'returns true for two valid anagram strings' do 
    expect(valid_anagram?("coat", "taco")).to eq(true)
  end
end

describe 'valid_anagram_ascii_array?' do 
  it 'returns true for two equal one letter strings' do 
    expect(valid_anagram_ascii_array?("t", "t")).to eq(true)
  end  
  it 'returns false for two non-equal one letter strings' do 
    expect(valid_anagram_ascii_array?("t", "s")).to eq(false)
  end  
  it 'returns true for two valid anagram strings' do 
    expect(valid_anagram_ascii_array?("coat", "taco")).to eq(true)
  end
end

describe 'valid_anagram_ascii_array_single_loop?' do 
  it 'returns true for two equal one letter strings' do 
    expect(valid_anagram_ascii_array_single_loop?("t", "t")).to eq(true)
  end  
  it 'returns false for two non-equal one letter strings' do 
    expect(valid_anagram_ascii_array_single_loop?("t", "s")).to eq(false)
  end  
  it 'returns true for two valid anagram strings' do 
    expect(valid_anagram_ascii_array_single_loop?("coat", "taco")).to eq(true)
  end
end