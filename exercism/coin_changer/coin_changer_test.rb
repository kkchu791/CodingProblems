require 'minitest/autorun'
require_relative 'coin_changer'

class CoinChangerTest < Minitest::Test
  def test_make_change_given_1_returns_1_penny
    assert_equal [1], Coin.make_change(1)
  end

  def test_make_change_given_2_returns_2_pennies
    assert_equal [1, 1], Coin.make_change(2)
  end

  def test_make_change_given_5_returns_1_nickle
    assert_equal [5], Coin.make_change(5)
  end

  def test_make_change_given_6_returns_1_nickle_and_1_penny
    assert_equal [5, 1], Coin.make_change(6)
  end

  def test_make_change_given_10_returns_1_dime
    assert_equal [10], Coin.make_change(10)
  end

  def test_make_change_given_15_returns_1_dime_and_1_nickel
    assert_equal [10, 5], Coin.make_change(15)
  end

  def test_make_change_given_23_returns_2_dime_and_3_pennies
    assert_equal [10, 10, 1, 1, 1], Coin.make_change(23)
  end

  def test_make_change_given_25_returns_1_quarter
    assert_equal [25], Coin.make_change(25)
  end

  def test_make_change_given_40_returns_1_quarter_and_1_dime_and_1_nickel
    assert_equal [25, 10, 5], Coin.make_change(40)
  end

  def test_make_change_given_50_returns_2_quarters
    assert_equal [25, 25], Coin.make_change(50)
  end

  def test_make_change_given_99_returns_3_quarters_and_2_dimes_and_4_pennnies
    assert_equal [25, 25, 25, 10, 10, 1, 1, 1, 1], Coin.make_change(99)
  end
end
