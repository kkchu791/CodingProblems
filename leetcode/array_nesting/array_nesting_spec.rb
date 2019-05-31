require 'rspec'
require_relative 'array_nesting'

describe 'Array Nesting Behavior' do
  it 'should return number of times it does the nesting without hitting a duplicate' do
    arr = [5,4,0,3,1,6,2]
    expect(array_nesting(arr)).to eq(4)
  end
end
