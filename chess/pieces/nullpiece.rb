require_relative 'piece'
require 'singleton'
class NullPiece < Piece
    include Singleton

    def self.instance(board)
        @@instance ||= new(board, "white", :null)    
    end

    def initialize(board, color = "white", symbol = :null)
        super
    end
end