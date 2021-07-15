module PlayManager
  class PlayUpdater < ApplicationService
    def initialize(game, row, col, mark)
      @game = game
      @row = row
      @col = col
      @mark = mark
    end

    def call
      @cell = Cell.new(@game.board[@row][@col])
      @cell.mark = @mark if @mark
      @cell.open = true unless @mark
      @game.status = 2 if @game.status == 1
      @game.status = 3 if @cell.mine

      reveal_cells(@row, @col) if @cell.value.zero?

      @game.save
    end

    private

    def reveal_cells(row, col)
      adjacent = GameManager::AdjacentRetriever.call(@game, row, col)
      zeros = []
      adjacent.each do |r, c|
        cell = Cell.new(@game.board[r][c])
        next if cell.open

        zeros.push([r, c]) if empty_cell(cell)
        @game.board[row][col][:open] = true
      end

      zeros.each do |r, c|
        reveal_cells(r, c)
      end
    end

    def empty_cell(cell)
      cell.value.zero? && !cell.mine && cell.mark.nil?
    end
  end
end