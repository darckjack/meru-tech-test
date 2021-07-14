module GameManager
  class AdjacentRetriever < ApplicationService
    def initialize(game, row, col)
      @game = game
      @row = row
      @col = col
    end

    def call
      adjacents = []
      (@row - 1..@row + 1).each do |r|
        (@col - 1..@col + 1).each do |c|
          adjacents.push([r, c]) if valid_pair(r, c)
        end
      end
        adjacents
    end

    private

    def valid_pair(row, col)
      row >= 0 && row < @game.rows.to_i &&
        col >= 0 && col < @game.cols.to_i &&
        !(row == @row && col == @col)
    end
  end
end
