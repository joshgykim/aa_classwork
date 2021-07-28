require "singleton"

class Piece

    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        "#{self.class}[0]"
    end

    def position=(position)
        @pos = position
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
            p dir
            possible_moves = self.grow_unblocked_moves_in_dir(dir[0], dir[1])
            moves += possible_moves
            p moves
            puts
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
            #new position based on our move
            new_row = self.pos[0] + dx * multiplier
            new_col = self.pos[1] + dy * multiplier

            # if new position is within the board,
            if new_row.between?(0, 7) && new_col.between?(0, 7)

                # if there is no piece
                if self.board[new_row][new_col] == NullPiece.instance
                    possible_moves << [new_row, new_col]
                
                # if there is a piece that is not the same color as self
                elsif self.board[new_row][new_col].color != self.color 
                    possible_moves << [new_row, new_col]
                    blocked = true

                # if it hits its own color
                else
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

class Knight < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
    end

end

class King < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
    end

end

class Pawn < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_dirs
    end

end

class NullPiece < Piece
    include Singleton

    def initialize
    end

end