# Recursive
# [0, 10, 43, 2]
# [0, 10], [43, 2]
# [0], [10], [43], [2]
# [0, 10], [2, 43]
# [0], [10], [2, 43]
# [0, 2], [10], [43]
# [0, 2, 10], [43]
# [0, 2, 10, 43]

def merge_sort(array_of_ints)
  
  array_length = array_of_ints.length  
  
  return array_of_ints if array_length === 1

  right_array = array_of_ints[0..(array_length/2-1)]
  left_array = array_of_ints[array_length/2..(array_length-1)]
  
  right_array = merge_sort(right_array)
  left_array = merge_sort(left_array)

  return merge(right_array, left_array)
end

def merge(right_arr, left_arr) 
  sorted_array = Array.new
  while right_arr.length > 0 && left_arr.length > 0
    if right_arr[0] > left_arr[0]
      sorted_array << left_arr[0]
      left_arr.delete_at(0)
    else 
      sorted_array << right_arr[0]
      right_arr.delete_at(0)
    end
  end
  while right_arr.length > 0
    sorted_array << right_arr[0]
    delete_at_index(right_arr, 0)
  end
  while left_arr.length > 0
    sorted_array << left_arr[0]
    delete_at_index(left_arr, 0)
  end
  sorted_array
end

def delete_at_index(array, i)
  # [0, 1, 2, 3, 4, 5], 3
  n = array.length
  number_of_opperations = n - i - 1

  number_of_opperations.times do
    array[i] = array[i + 1]
    i += 1
  end
  array.pop
  array
end


describe 'merge_sort' do 
  let(:ten_num_array) {[100, 31, 65, 2, 20, 400, 17, 25, 1, 0]}
  let(:sorted_ten_num_array) {[0, 1, 2, 17, 20, 25, 31, 65, 100, 400]}

  it 'sorts a one element array' do
    expect(merge_sort([1])).to eq([1])
  end

  it 'sorts an unsorted two element array' do
    expect(merge_sort([3, 0])).to eq([0, 3])
  end

  it 'sorts an unsorted five element array' do
    expect(merge_sort([0, 10, 43, 22, 2])).to eq([0, 2, 10, 22, 43])
  end

  it 'sorts an unsorted four element array' do
    expect(merge_sort([0, 10, 43, 2])).to eq([0, 2, 10, 43])
  end

  it 'sorts an unsorted ten element array' do
    expect(merge_sort(ten_num_array)).to eq(sorted_ten_num_array)
  end

  it 'sorts an already sorted ten element array' do
    expect(merge_sort(sorted_ten_num_array)).to eq(sorted_ten_num_array)
  end
end

describe 'merge' do

  it 'sorts two one element arrays' do 
    expect(merge([5], [0])).to eq([0, 5])
  end

  it 'sorts two pre-sported 5 element arrays' do 
    expect(merge([2, 20, 31, 65, 100], [0, 1, 17, 25, 400])).to eq([0, 1, 2, 17, 20, 25, 31, 65, 100, 400])
  end

end

describe 'delete_at_index' do

  it 'removes the 0 index item of a 1 item array' do
    expect(delete_at_index([1], 0)).to eq([])
  end 

  it 'removes the 3 index item of a 6 item array' do
    expect(delete_at_index([0, 1, 2, 3, 4, 5], 3)).to eq([0, 1, 2, 4, 5])
  end 

end
  



