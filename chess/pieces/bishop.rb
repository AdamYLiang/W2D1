require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
    include Slideable
    #def initialize(color = "white", symbol = "n", board)
    def initialize(board, color, symbol = :bishop)
        super
    end

    def move_dirs
        diagonal_dirs
    end
end