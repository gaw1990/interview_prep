# Sort an array of unsorted integers into ascending order

# Original solution
# def bubble_sort(num_array)
#   loop do
#     number_of_sorting_actions = 0

#     num_array.each_with_index.map do |x, i|
#       next if !num_array[i+1]
#       if num_array[i] > num_array[i+1]
#         temp = num_array[i+1]
#         num_array[i+1] = num_array[i]
#         num_array[i] = temp
#         number_of_sorting_actions +=1
#       end
#     end
#     return num_array if number_of_sorting_actions == 0
#   end
# end

# Refactored solution
def bubble_sort(num_array)
  n = num_array.length

  loop do
    number_of_sorting_actions = 0
    (n-1).times do |i|
      if num_array[i] > num_array[i+1]
        num_array[i], num_array[i+1] = num_array[i+1], num_array[i]
        number_of_sorting_actions +=1
      end
    end
    return num_array if number_of_sorting_actions == 0
  end
end


describe 'bubble_sort' do 
  let(:ten_num_array) {[100, 31, 65, 2, 20, 400, 17, 25, 1, 0]}
  let(:sorted_ten_num_array) {[0, 1, 2, 17, 20, 25, 31, 65, 100, 400]}

  it 'sorts a one element array' do
    expect(bubble_sort([1])).to eq([1])
  end

  it 'sorts an unsorted two element array' do
    expect(bubble_sort([3, 0])).to eq([0, 3])
  end

  it 'sorts an unsorted ten element array' do
    expect(bubble_sort(ten_num_array)).to eq(sorted_ten_num_array)
  end

  it 'sorts an already sorted ten element array' do
    expect(bubble_sort(sorted_ten_num_array)).to eq(sorted_ten_num_array)
  end
end



