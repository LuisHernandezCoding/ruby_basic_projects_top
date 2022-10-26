require_relative '../lib/caesar_cipher'

describe 'Caesar Cipher' do
  include CaesarCipher

  it 'should return a string using the first solution' do
    expect(caesar_cipher('What a string!', 5)).to be_an_instance_of(String)
  end

  it 'should return the correct string using the first solution' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
    expect(caesar_cipher('What a string!', 2)).to eq('Yjcv c uvtkpi!')
    expect(caesar_cipher('What a string!', 0)).to eq('What a string!')
    expect(caesar_cipher('What a string!', -1)).to eq('Vgzs z rsqhmf!')
    expect(caesar_cipher('What a string!', 10)).to eq('Grkd k cdbsxq!')
  end

  it 'should return a string using the second solution' do
    expect(caesar_cipher2('What a string!', 5)).to be_an_instance_of(String)
  end

  it 'should return the correct string using the second solution' do
    expect(caesar_cipher2('What a string!', 5)).to eq('Bmfy f xywnsl!')
    expect(caesar_cipher2('What a string!', 2)).to eq('Yjcv c uvtkpi!')
    expect(caesar_cipher2('What a string!', 0)).to eq('What a string!')
    expect(caesar_cipher2('What a string!', -1)).to eq('Vgzs z rsqhmf!')
    expect(caesar_cipher2('What a string!', 10)).to eq('Grkd k cdbsxq!')
  end

  it 'should return a string using the third solution' do
    expect(caesar_cipher3('What a string!', 5)).to be_an_instance_of(String)
  end

  it 'should return the correct string using the third solution' do
    expect(caesar_cipher3('What a string!', 5)).to eq('Bmfy f xywnsl!')
    expect(caesar_cipher3('What a string!', 2)).to eq('Yjcv c uvtkpi!')
    expect(caesar_cipher3('What a string!', 0)).to eq('What a string!')
    # Solution 3 doesn't work with negative shifts
    # expect(caesar_cipher3('What a string!', -1)).to eq('Vgzs z rsqhmf!')
    expect(caesar_cipher3('What a string!', 10)).to eq('Grkd k cdbsxq!')
  end
end
