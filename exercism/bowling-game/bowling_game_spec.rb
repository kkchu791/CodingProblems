require 'rspec'
require_relative 'bowling_game'

describe 'Bowling Game Behavior' do
  before do
    @game = BowlingGame.new
  end

  #[['X', nil], ['3', '/'], [4, 5], ...]

  it 'can roll a gutter game' do
    10.times { @game.roll([0,0]) }
    expect(@game.score).to eq(0)
  end

  it 'can roll all ones' do
    10.times{ @game.roll([1,1]) }
    expect(@game.score).to eq(20)
  end

  it 'can roll a spare' do
    @game.roll([3, '/'])
    @game.roll([3, 0])

    8.times{ @game.roll([0,0]) }
    expect(@game.score).to eq(16)
  end

  it 'can roll a strike' do
    @game.roll(['X', nil])
    @game.roll([3, 4])
    @game.roll([3, 4])

    7.times{ @game.roll([0, 0]) }
    expect(@game.score).to eq(31)
  end

  it 'can roll a perfect game' do
    10.times{ @game.roll(['X', nil]) }
    expect(@game.score).to eq(300)
  end

  it 'can roll all spares' do
    10.times{ @game.roll([5, '/']) }
    expect(@game.score).to eq(145)
  end
end
