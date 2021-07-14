class Game < ApplicationRecord
  enum status: { not_started: 0, in_progress: 1, finished: 2 }
  before_create :make_board

  validates :cols, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :rows, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, presence: true, numericality: {
    only_integer: true,
    less_than: proc { |game|
      game.cols * game.rows
    }
  }

  private

  def make_board
    self.board = Array.new(rows, Array.new(cols))
  end
end
