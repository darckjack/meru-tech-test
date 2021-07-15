class Game < ApplicationRecord
  enum status: { not_started: 0, in_progress: 1, finished: 2 }
  before_create :make_board
  after_update :check_finish

  validates :cols, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :rows, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, presence: true, numericality: {
    only_integer: true,
    less_than: proc { |game|
      game.cols * game.rows
    }
  }

  def cells_with_mines
    mines = []
    board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        cell = Cell.new(cell)
        mines.push([i, j]) if cell.mine
      end
    end
    mines
  end

  private

  def check_finish
    self.status = 2 if win_condition
  end

  def win_condition
    cells_open.count == (rows * cols) - mines
  end

  def cells_open
    mines = []
    board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        cell = Cell.new(cell)
        mines.push([i, j]) if cell.open
      end
    end
    mines
  end

  def make_board
    self.status = 0
    self.board = Array.new(rows, Array.new(cols, Cell.new))
    GameManager::BoardInitializer.call(self)
  end
end
