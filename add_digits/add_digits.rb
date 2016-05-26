# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
# For example:
# Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

#Non-recursive
  # def add_digits(num)
  #   # takes num
  #   # start loop
  #   # adds all digits
  #   # checks if it has one digit
  #   # end loop
  #   working_number = n
  #   loop do 
  #     num_array = split_digits(working_number)
  #     num_array_sum = add_array_ints(num_array)
  #     return num_array_sum if num_array_sum.to_s.length == 1
  #     working_number = num_array_sum
  #   end
  # end

# Recursive

  def add_digits(num)
    return num if num.to_s.length == 1
    int_array = split_digits(num)
    sum = add_array_ints(int_array)
    return add_digits(sum)
  end


def split_digits(n)
  digit_array = n.to_s.split('')
  digit_array.map! do |x|
    Integer(x)
  end
  digit_array
end

def add_array_ints(n) 
#takes an array, adds all of it's elements together, returns the sum
  sum = 0
  n.each do |x|
    sum += x
  end
  sum
end





describe 'add_digits' do 

  it 'adds the digits of an input requiring no steps' do
    expect(add_digits(1)).to eq(1)
  end

  it 'adds the digits of an input requiring one step' do
    expect(add_digits(11)).to eq(2)
  end

  it 'adds the digits of an input requiring two steps' do
    expect(add_digits(91)).to eq(1)
  end

end

describe 'split_digits' do 

  it 'splits an integer into an array of that integer\'s digits' do
    expect(split_digits(54321)).to eq([5, 4, 3, 2, 1])
  end

end

describe 'add_array_ints' do

  it 'adds the elements of an array' do
    expect(add_array_ints([1, 2, 3, 6])).to eq(12)
  end

end





