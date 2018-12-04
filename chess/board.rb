require_relative 'pieces'
class Board 
    attr_reader :grid
    attr_accessor :selected_piece
    def initialize
        @grid = place_pieces
        @selected_piece = nil
        assign_positions

    end

    def place_pieces
        array = []

        #Create special pieces
        #Create pawn row
        array << special_row("black")
        array << Array.new(8){Pawn.new(self, "black")}
        #Create singleton null x4
        null = NullPiece.instance(self)
        4.times do
            array << Array.new(8,null)
        end
        #create pawn row
        array << Array.new(8){Pawn.new(self, "white")}
        #create special pieces.reverse
        array << special_row("white")
        
        array
    end

    def assign_positions
        (0..7).each do |i|
            (0..7).each do |j|
                next if @grid[i][j].is_a?(NullPiece)
                @grid[i][j].pos = [i,j]
            end
        end
    end


    def move_piece(start_pos, end_pos)
        #raise exceptions: no piece at start, can't move to end
        puts "selected piece is #{self[start_pos].pos}"
        puts "swap piece is #{self[end_pos].pos}"
        raise "No piece at start_pos" if self[start_pos].is_a?(NullPiece)
        raise "Can't move to end_pos" unless self[end_pos].is_a?(NullPiece)

        self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
        assign_positions
        @selected_piece = nil
    end

    def valid_pos?(pos)
        pos[0].between?(0,7) && pos[1].between?(0,7)
    end

    def [](pos)
        x, y = pos 
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        grid[x][y] = val
    end

    def empty?(pos)
        self[pos].is_a?(NullPiece) 
    end

    def in_check?(color)
        opp_color = color == :white ? :black : :white

        king = @grid.flatten.find{|piece| piece.symbol == 'K' && piece.color == color}

        opp_team = @grid.flatten.select do |piece|
            piece.color == opp_color
        end

        opp_team.any? do |piece|
            piece.valid_moves.include?(king.pos)
        end
    end

    def checkmate?(color)
        if in_check?(color)
            @grid.flatten.all? do |own_piece|
                own_piece.valid_moves == []
            end
        end
    end
        
    def render(cursor_pos, selected)
        puts "   " + ('a'..'h').to_a.join("    ")
        grid.each_with_index do |row, i|
            string = "#{8-i} "
            row.each_with_index do |position, j|
                if [i,j] == cursor_pos
                    if selected 
                        string += "#{position}".colorize(:color => :red, :background => :blue)
                    else
                        string += "#{position}".colorize(:color => :blue, :background => :light_magenta)
                    end
                else
                    string += "#{position}".colorize(position.color) 
                end
                string += "    "
            end

            puts "\n #{string}"
        end
    end

    private
    def special_row(color)
        row = []
        row << Rook.new(self, color)
        row << Knight.new(self, color)
        row << Bishop.new(self, color)
        row << Queen.new(self, color)
        row << King.new(self, color)
        row << Bishop.new(self, color)
        row << Knight.new(self, color)
        row << Rook.new(self, color)
        row
    end
end