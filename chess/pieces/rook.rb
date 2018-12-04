require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
    include Slideable
    #def initialize(color = "white", symbol = "n", board)
    def initialize(board, color, symbol = :rook)
        super
    end

    def move_dirs
        horizontal_dirs
    end
end