require_relative 'steppable'
require_relative 'piece'

class Knight < Piece
    include Steppable
    #def initialize(color = "white", symbol = "n", board)
    def initialize(board, color, symbol = :knight)
        super
    end

    def move_diffs
        [
            [-2, 1],
            [-1, -2],
            [2, 1],
            [2, -1],
            [-2, -1],
            [1, 2],
            [-1, 2],
            [1, -2]
        ]
    end
end