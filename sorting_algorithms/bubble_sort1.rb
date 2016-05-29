def bubble_sort(array)
  loop do
    sorting_actions = 0
    (array.length - 1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorting_actions += 1
      end
    end
    return array if sorting_actions == 0
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
