require_relative 'pieces'
class Board 
    attr_reader :grid
    def initialize
        @grid = place_pieces
        assign_positions

    end

    def place_pieces
        array = []

        array << Array.new(8){Pawn.new(self, "black")}
        array << Array.new(8){Pawn.new(self, "white")}
        # 2.times do |i|
        #     array << Array.new(8){Pawn.new(self, "black")}
        # end
        4.times do |i|
            array << Array.new(8){NullPiece.new(self, "white")}
        end
        2.times do |i|
            array << Array.new(8){Bishop.new(self, "white")}
        end

        
        array
    end

    def assign_positions
        (0..7).each do |i|
            (0..7).each do |j|
                next if grid[i][j].is_a?(NullPiece)
                grid[i][j].pos = [i,j]
            end
        end
    end

    def move_piece(start_pos, end_pos)
        #raise exceptions: no piece at start, can't move to end

        raise "No piece at start_pos" if self[start_pos].is_a?(NullPiece)
        raise "Can't move to end_pos" unless self[end_pos].is_a?(NullPiece)

        self[end_pos] = self[start_pos]
        #grid[start_pos[0]][start_pos[1]] = NullPiece.new
        self[start_pos] = NullPiece.new
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

    #Display.new(Board.new).render
    def render(cursor_pos, selected)
        puts "  " + ('a'..'h').to_a.join("    ")
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

            puts string
        end
    end
end