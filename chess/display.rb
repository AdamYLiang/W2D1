require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def render
        #until @cursor.get_input == @cursor.cursor_pos
        while true
            system('clear')
            @board.render(@cursor.cursor_pos, @cursor.selected)
            @cursor.get_input
            #toggle here
            system('clear')
            @board.render(@cursor.cursor_pos, @cursor.selected)
            break
        end
    end
end