class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def moves
        case self.class 
        when Sliders
            self.move_dirs
        end
    end

    def inspect
        "P"
    end

end

module Slideable
    HORIZONTAL_DIRS = [[0,1],[1,0],[-1,0],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]
    def horizontal_dirs 

    end
end

class Sliders < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs

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