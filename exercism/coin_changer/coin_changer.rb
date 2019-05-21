class Coin
  def self.make_change(amount)

    res = []

    coins = [25, 10, 5, 1]

    coins.each do |coin_amount|
      while amount >= coin_amount
        res << coin_amount
        amount -= coin_amount
      end
    end

    res
  end
end
