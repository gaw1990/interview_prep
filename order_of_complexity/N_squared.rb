def contains_duplicates?(elements)
  elements.each_with_index do |outer, outer_index|
    elements.each_with_index do |inner, inner_index|
      next if outer_index == inner_index
      return true if outer == inner
    end
  end
  return false
end




describe 'contains_duplicates?' do
  let(:elements_without_duplicates) {[1, 2, 3, 4, 5, 6, 7, 8, 9, 12]}
  let(:elements_with_duplicates) {[1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 1]}

  it 'returns false for a one element array' do
    expect(contains_duplicates?([1])).to eq(false)
  end

  it 'returns true for an array of elements with duplicate values' do
    expect(contains_duplicates?(elements_with_duplicates)).to eq(true)
  end
  
  it 'returns false for an array of elements without duplicate values' do
    expect(contains_duplicates?(elements_without_duplicates)).to eq(false)
  end

end