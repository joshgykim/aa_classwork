require "singleton"

class Piece

    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        "#{self.class.to_s[0]}"
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

module Stepable 

    def move
        possible_moves = []
        self.move_diffs.each do |diff|
            possible_moves += valid_moves_in_diff(diff[0], diff[1])
        end 
        return possible_moves
    end

    def valid_moves_in_diff(dx, dy)
        moves = []

        new_row = self.pos[0] + dx
        new_col = self.pos[1] + dy
        if (new_row).between?(0, 7) && (new_col).between?(0, 7) 
            if self.board[new_row][new_col] == NullPiece.instance || self.color != self.board[new_row][new_col].color
                moves << [new_row, new_col]
            end
        end
        return moves 
    end
end

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_diffs
        [[2,1], [2,-1], [-2,1], [-2,-1], [1, 2], [1, -2], [-1, 2], [-1,-2]]
    end

end

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def move_diffs
        [[0,1],[1,0],[-1,0],[0,-1],[1,1],[1,-1],[-1,1],[-1,-1]]
    end

end

class Pawn < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color
    end

    def at_start_row?
        return true if self.color == :B && self.pos[0] == 1
        return true if self.color == :W && self.pos[0] == 6 
        return false
    end

    def forward_dir
        [[1, 0],[-1, 0]]
    end

    def forward_steps
        # if self.at_start_row? 
    end

    def moves
        possible_moves = self.side_attack

        all_dirs = self.forward_dir # [[1, 0],[-1, 0], [2,0]]

        if self.at_start_row?
            all_dirs << [2, 0] if self.color == :B
            all_dirs << [-2, 0] if self.color == :W
        end
        
        all_dirs.each do |dir|
            possible_moves += valid_moves_in_dir(dir[0], dir[1])
        end
        possible_moves
    end

    def valid_moves_in_dir(dx, dy)
        valid_moves = []

        new_row = self.pos[0] + dx
        new_col = self.pos[1] + dy

        if self.color == :B
            if self.board[new_row][new_col] == NullPiece.instance
                if dx == 2 && self.board[new_row-1][new_col] == NullPiece.instance
                    valid_moves << [new_row, new_col]
                elsif dx == 1 || dx == -1
                    valid_moves << [new_row, new_col]
                end
            end
        elsif self.color == :W
            if self.board[new_row][new_col] == NullPiece.instance
                if dx == -2 && self.board[new_row+1][new_col] == NullPiece.instance
                    p self.board[new_row+1][new_col]
                    valid_moves << [new_row, new_col]
                elsif dx == 1 || dx == -1
                    valid_moves << [new_row, new_col]
                end
            end
        end

        valid_moves
    end

    def side_attack
        moves = []

        row = self.pos[0]
        col = self.pos[1]

        if self.color == :B
            if self.board[row+1][col+1].color == :W
                moves << [row+1, col+1]
            elsif self.board[row+1][col-1].color == :W
                moves << [row+1, col-1]
            end
        else
            if self.board[row-1][col+1].color == :B
                moves << [row-1, col+1]
            elsif self.board[row-1][col-1].color == :B
                moves << [row-1, col-1]
            end
        end
        moves
    end

end

class NullPiece < Piece
    include Singleton

    def initialize
    end

end