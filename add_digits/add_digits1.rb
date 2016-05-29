
# # Solution 1 (Naive)
# def add_digits(num)
#   loop do 
#     int_array = integer_to_array(num)
#     num = sum_int_digits(int_array)
#     break if num - 9 <= 0
#   end
#   num
# end

# def sum_int_digits(int_array)
#   sum = 0
#   int_array.each do |i|
#     sum += i
#   end
#   sum
# end

# def integer_to_array(int)
#   int.to_s.split('').map{|x| Integer(x)}
# end


def add_digits(num)
  return num if num / 10 == 0
  sum = num % 9
  sum == 0 ? 9 : sum
end



describe 'add_digits' do 
  it 'should add the digits of a one step number (11)' do
    expect(add_digits(11)).to eq(2)
  end
  it 'should add the digits of a two step number (58)' do
    expect(add_digits(58)).to eq(4)
  end
  it 'should add the digits of a three step number (99)' do
    expect(add_digits(99)).to eq(9)
  end
  it 'should respond properly to 0' do
    expect(add_digits(0)).to eq(0)
  end  
  it 'should respond properly to 5' do
    expect(add_digits(5)).to eq(5)
  end
end