require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'is valid with valid attributes' do
    game = Game.new(
      cols: 5,
      rows: 5,
      mines: 5
    )
    expect(game).to be_valid
  end
  it 'is not valid without columns' do
    game = Game.new(cols: nil)

    expect(game).to_not be_valid
  end
  it 'is not valid without rows' do
    game = Game.new(rows: nil)

    expect(game).to_not be_valid
  end
  it 'is not valid without mines' do
    game = Game.new(mines: nil)

    expect(game).to_not be_valid
  end

  it 'creates a new board' do
    game = Game.create(
      cols: 5,
      rows: 5,
      mines: 5
    )

    expect(game.board).to_not be_nil
  end

  describe 'should have more cells than mines' do
    it 'is valid with more cells than mines' do
      game = Game.new(
        cols: 5,
        rows: 5,
        mines: 6
      )

      expect(game).to be_valid
    end

    it 'is not valid with more mines than cells' do
      game = Game.new(
        cols: 2,
        rows: 2,
        mines: 6
      )

      expect(game).to_not be_valid
    end
  end
end
