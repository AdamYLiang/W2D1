module Steppable
    def moves
        move_diffs.each_with_object([]) do |(dx,dy), moves|
            x, y = pos

            x, y = x + dx, y + dy

            next unless @board.valid_pos?([x,y])

            if @board.empty?([x,y])
                moves << [x,y]
            elsif @board[[x,y]].color != color
                moves << [x,y]
            end
        end
    end

    private
    def move_diffs
        raise NotImplementedError
    end
end