require_relative '../lib/sub_strings'

describe 'SubStrings' do
  include SubStrings

  string = 'Howdy partner, sit down! How\'s it going?'
  dictionary = %w[below down go going horn how howdy it i low own part partner sit]
  correct_hash = {}
  correct_hash['down'] = 1
  correct_hash['go'] = 1
  correct_hash['going'] = 1
  correct_hash['how'] = 2
  correct_hash['howdy'] = 1
  correct_hash['i'] = 3
  correct_hash['it'] = 2
  correct_hash['own'] = 1
  correct_hash['part'] = 1
  correct_hash['partner'] = 1
  correct_hash['sit'] = 1

  it 'should return a hash using the first solution' do
    expect(substrings(string, dictionary)).to be_an_instance_of(Hash)
  end

  it 'should return the correct hash using the first solution' do
    expect(substrings(string, dictionary)).to eq(correct_hash)
  end

  it 'should return a hash using the second solution' do
    expect(substrings2(string, dictionary)).to be_an_instance_of(Hash)
  end

  it 'should return the correct hash using the second solution' do
    expect(substrings2(string, dictionary)).to eq(correct_hash)
  end

  it 'should return a hash using the third solution' do
    expect(substrings3(string, dictionary)).to be_an_instance_of(Hash)
  end

  it 'should return the correct hash using the third solution' do
    expect(substrings3(string, dictionary)).to eq(correct_hash)
  end
end
