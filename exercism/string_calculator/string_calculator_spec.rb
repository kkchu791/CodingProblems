require 'rspec'
require_relative 'string_calculator'

describe 'String Calculator Behavior' do
  before do
    @calculator = StringCalculator.new()
  end

  describe '#add' do

    it "will return 0 when given an empty string" do
      expect(@calculator.add("")).to eq(0)
    end

    it "will return 1 when given a string '1'" do
      expect(@calculator.add("1")).to eq(1)
    end

    it "will return 3 when given a string '12'" do
      expect(@calculator.add("12")).to eq(3)
    end

    it "will return the sum of a string with a new line in it" do
      expect(@calculator.add("1\n2,3")).to eq(6)
    end

    it "will return the sum of a string with a different delimiter" do
      expect(@calculator.add('//;\n1;2')).to eq(3)
    end

    it "will return the sum of a string with a long delimiter" do
      expect(@calculator.add('//[***]\n1***2***3')).to eq(6)
    end

    it "will throw an exception when calling add with a negative number" do
      expect{@calculator.add("-8")}.to raise_error(RuntimeError, 'Negatives not allowed: -8')
    end

    it "will throw an exception when given negative numbers and will show negative numbers in the error message" do
      expect{@calculator.add("-8-2-4")}.to raise_error(RuntimeError, 'Negatives not allowed: -8-2-4')
    end

    it "will throw an exception when given negative numbers and will show negative numbers in the error message" do
      expect{@calculator.add("-8-2-4")}.to raise_error(RuntimeError, 'Negatives not allowed: -8-2-4')
    end
  end

  describe '#get_called_count' do
    before do
      @calculator.add("1")
      @calculator.add("2")
    end

    it "will return count of how many times add was invoked" do
      expect(@calculator.get_called_count).to eq(2)
    end
  end
end
