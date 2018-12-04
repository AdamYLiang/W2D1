require 'colorize'
class Piece
    attr_reader :color, :symbol, :pos

    COLORS = {
        "blue" => :blue,
        "black" => :black,
        "grey" => :grey,
        "red" => :red,
        "white"=> :white
    }

    PIECES = {
        :rook => "R",
        :knight => "N",
        :bishop => "B",
        :queen => "Q",
        :king => "K",
        :pawn => "P",
        :null => "\u2603"
    }

    def initialize(board, color = "white", symbol = :null)
        @color = COLORS[color]
        @symbol = PIECES[symbol]
        @board = board
        @pos = nil
    end
    #colorize why you work so well

    def to_s    
        # puts "#{@symbol}"
        @symbol
    end

    def empty?(pos)

    end

    def valid_moves

    end

    def pos=(val)
        puts "value is #{val}"
        @pos = val
    end

    private
    def move_into_check?(end_pos)

    end
end