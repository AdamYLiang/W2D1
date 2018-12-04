module Slideable
    HORIZONTAL_DIRS = [
        [0, -1],
        [0, 1],
        [-1, 0],
        [1, 0]
    ].freeze
    DIAGONAL_DIRS = [
        [-1, 1],
        [-1, -1],
        [1, 1],
        [1, -1]
    ].freeze


    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves 
        moves = []
        move_dirs.each do |delta|
            moves += grow_unblocked_moves_in_dir(delta)
        end
        moves
    end

    private
    def move_dirs
        #override returns proper directions for piece
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(delta)
        x, y = pos
        dx, dy = delta

        moves = []
        loop do
            x = x + dx
            y = y + dy
            puts @board.valid_pos?([x,y])
            #puts "this is board pos #{@board[[x,y]].color} at #{x} #{y}"
            break unless @board.valid_pos?([x,y])
            
            if @board.empty?([x,y])
                moves << [x,y]
            else
                moves << [x,y] if @board[[x,y]].color != color
                break
            end
        end

        moves
    end
end