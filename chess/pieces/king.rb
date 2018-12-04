require_relative 'steppable'
require_relative 'piece'

class King < Piece
    include Steppable
    #def initialize(color = "white", symbol = "n", board)
    def initialize(board, color, symbol = :king)
        super
    end

    def move_diffs
        [
            [-1, 1],
            [-1, -1],
            [1, 1],
            [1, -1],
            [0, -1],
            [0, 1],
            [-1, 0],
            [1, 0]
        ]
    end
end