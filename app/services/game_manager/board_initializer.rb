module GameManager
  class BoardInitializer < ApplicationService
    def initialize(game)
      @game = game
    end

    def call
      initialize_mines
      initialize_values
    end

    private

    def initialize_mines
      mines = []
      while mines.count < @game.mines
        row = rand(@game.rows)
        col = rand(@game.cols)
        cell = Cell.new(@game.board[row][col])
        next if cell.open || mines.include?([row, col])

        @game.board[row][col][:mine] = true
        mines << [row, col]
      end
    end

    def initialize_values
      @game.board.each_with_index do |row, i|
        row.each_with_index do |cell, j|
          cell = Cell.new(cell)
          next if cell.mine

          adjacent = AdjacentRetriever.call(@game, i, j)
          value_array = adjacent & @game.cells_with_mines
          @game.board[i][j][:value] = value_array.count
        end
      end
    end
  end
end
