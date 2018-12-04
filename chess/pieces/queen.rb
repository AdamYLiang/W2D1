require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
    include Slideable
    #def initialize(color = "white", symbol = "n", board)
    def initialize(board, color, symbol = :queen)
        super
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end