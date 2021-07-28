class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        "P"
    end

end



module Slideable
    HORIZONTAL_DIRS = [[0,1],[1,0],[-1,0],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        dirs = self.move_dirs

        dirs.each do |dir|
            possible_moves = self.grow_unblocked_moves_in_dir(dir[0], dir[1])
            moves += possible_moves
        end
        moves
    end

    def move_dirs
        raise "Subclass method did not override!"
    end

    # returns all moves that the piece can travel to in a GIVEN DIRECTION
    def grow_unblocked_moves_in_dir(dx, dy)
        possible_moves = []
        multiplier = 1
        blocked = false
        until blocked
            new_row = self.pos[0] + dx * multiplier
            new_col = self.pos[1] + dy * multiplier
            if new_row.between?(0, 7) && new_col.between?(0, 7)
                pos = [new_row, new_col]
                if self.board[pos].class == NullPiece
                    possible_moves << pos
                elsif self.board[pos].color != self.color 
                    possible_moves << pos
                    blocked = true
                end
            else 
                blocked = true
            end 
            multiplier += 1
        end
        possible_moves
    end

    def movable

    end

end

class Rook < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
        horizontal_dirs
    end

end

class Bishop < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
        diagonal_dirs
    end

end

class Queen < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
        diagonal_dirs + horizontal_dirs
    end

end























class Steppers < Piece

    def initialize(color, board, pos)
        super
    end
end

class Pawn < Piece

    def initialize(color, board, pos)
        super
    end
end

class NullPiece < Piece

    def initialize(color, board, pos)
        super
    end
end