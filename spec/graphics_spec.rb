require_relative '../lib/graphics'

describe 'Graphics' do
  include Graphics

  it 'should return an array' do
    expect(getting_title).to be_an_instance_of(Array)
    expect(getting_bubble_sort_title).to be_an_instance_of(Array)
    expect(getting_caesar_cipher_title).to be_an_instance_of(Array)
    expect(getting_stock_picker_title).to be_an_instance_of(Array)
    expect(getting_substrings_title).to be_an_instance_of(Array)
    expect(getting_menu_block('Main Menu',
                              ['Bubble Sort', 'Caesar Cipher', 'Stock Picker',
                               'Sub Strings'])).to be_an_instance_of(Array)
  end
end
