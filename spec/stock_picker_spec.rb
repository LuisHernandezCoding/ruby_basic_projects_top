require_relative '../lib/stock_picker'

describe 'stock_picker' do
  include StockPicker

  strock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10, 2, 1, 4, 8, 2, 12]

  it 'should return an array using the first solution' do
    expect(stock_picker(strock_prices)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the first solution' do
    expect(stock_picker(strock_prices)).to eq([1, 4])
  end

  it 'should return an array using the second solution' do
    expect(stock_picker2(strock_prices)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the second solution' do
    expect(stock_picker2(strock_prices)).to eq([1, 4])
  end

  it 'should return an array using the third solution' do
    expect(stock_picker3(strock_prices)).to be_an_instance_of(Array)
  end

  it 'should return the correct array using the third solution' do
    expect(stock_picker3(strock_prices)).to eq([1, 4])
  end
end
