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
            selected_input = @cursor.get_input
    
            #if truthy and s_piece.nil? then hold selected_input piece
            if @cursor.selected && @board.selected_piece.nil?
                @board.selected_piece = @board[selected_input]
            elsif @cursor.selected == false && @board.selected_piece != nil 
                @board.move_piece(@board.selected_piece.pos, selected_input)
            end
            #toggle here
            # first_input = @cursor.get_input

            # if @cursor.selected
            #     input = first_input
            #     second_input = @cursor.get_input
            #     until second_input
                    
            #     end

            #     system('clear')
            #     @board.render(@cursor.cursor_pos, @cursor.selected)
            #     end
            # end

            #system('clear')
            @board.render(@cursor.cursor_pos, @cursor.selected)
        end
    end
end