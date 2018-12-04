require_relative 'piece'
class NullPiece < Piece
    def initialize(board, color = "white", symbol = :null)
        super
    end
end