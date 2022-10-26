require_relative '../lib/bubble_sort'

describe 'bubble_sort' do
  include BubbleSort

  array_to_sort = [4, 3, 78, 2, 0, 2, 54, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  sorted_array = [0, 1, 2, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 54, 78]

  it 'should return an array using the first solution' do
    expect(bubble_sort(array_to_sort)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the first solution' do
    expect(bubble_sort(array_to_sort)).to eq(sorted_array)
  end

  it 'should return an array using the second solution' do
    expect(bubble_sort2(array_to_sort)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the second solution' do
    expect(bubble_sort2(array_to_sort)).to eq(sorted_array)
  end

  it 'should return an array using the third solution' do
    expect(bubble_sort3(array_to_sort)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the third solution' do
    expect(bubble_sort3(array_to_sort)).to eq(sorted_array)
  end
end
