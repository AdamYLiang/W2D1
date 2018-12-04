require_relative 'piece'

class Pawn < Piece

    def initialize(board, color, symbol = :pawn)
        super   
    end

    def moves
        side_attacks + forward_steps
    end

    
    def at_start_row?
        return true if color == :black && pos[0] == 1
        return true if color == :white && pos[0] == 6
        false
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def forward_steps
        x, y = pos 
        first_step = [x + forward_dir, y]
        return [] unless @board.valid_pos?(first_step) && @board.empty?(first_step)
        moves = [first_step]
        second_step = [x + 2 * forward_dir, y] 
        moves << second_step if at_start_row? && @board.empty?(second_step)
        moves 
    end

    def side_attacks
        x, y = pos 
        possible_atks = []

        if color == :black
            delta = [
                [1,1],
                [1,-1]
            ]
            delta.each do |el|
                dx, dy = el 
                
                next unless @board.valid_pos?([x+dx, y+dy]) 
                possible_atks << [x+dx, y+dy] if @board[[x+dx, y+dy]].symbol != "\u2603" && @board[[x+dx, y+dy]].color == :white
            end
        elsif color == :white
            delta = [
                [-1,1],
                [-1,-1]
            ]
            delta.each do |el|
                dx, dy = el 
                
                next unless @board.valid_pos?([x+dx, y+dy]) 
                possible_atks << [x+dx, y+dy] if @board[[x+dx, y+dy]].symbol != "\u2603" && @board[[x+dx, y+dy]].color == :black
            end
        end
        possible_atks
    end
end