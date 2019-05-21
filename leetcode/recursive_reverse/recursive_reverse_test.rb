require 'minitest/autorun'
require_relative 'recursive_reverse'

class RecursiveReverseTest < Minitest::Test
  def test_reverse_of_string
    assert_equal "olleh", recursiveReverse("hello")
  end

  def test_reverse_of_empty_string
    assert_equal "", recursiveReverse("")
  end

  def test_reverse_of_a_non_string
    assert_raises ArgumentError do
      recursiveReverse(010)
    end
  end
end
