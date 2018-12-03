require 'colorize'
class Piece
    attr_reader :color, :name, :selected

    COLORS = {
        "blue" => :blue,
        "black" => :black,
        "grey" => :grey,
        "red" => :red,
        "white"=> :white
    }

    #NullPiece is white since terminal is white
    def initialize(color = "white", name = "n")
        @color = COLORS[color]
        @name = name
        @selected = false
    end
    #colorize why you no work

    def select_color
        selected ? :red : color
    end

    def toggle_selected
        selected = !selected
    end

    def to_s    
        name
    end
end