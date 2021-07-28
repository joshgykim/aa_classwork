require_relative "piece.rb"

class Board

    attr_reader :board

    def initialize
        @board = start_board
    end

    def start_board
        board = []
        (0..7).each do |row_i|
            row = []
            (0..7).each do |col_i|
                if row_i.between?(2, 5)
                    row << NullPiece.instance
                elsif row_i == 1 
                    row << Pawn.new(:B, self.board, [row_i, col_i])
                elsif row_i == 6
                    row << Pawn.new(:W, self.board, [row_i, col_i])
                elsif row_i == 0 
                    if col_i == 0 || col_i == 7
                        row << Rook.new(:B, self.board, [row_i, col_i])
                    elsif col_i == 1 || col_i == 6
                        row << Knight.new(:B, self.board, [row_i, col_i])
                    elsif col_i == 2 || col_i == 5 
                        row << Bishop.new(:B, self.board, [row_i, col_i])
                    elsif col_i == 3 
                        row << Queen.new(:B, self.board, [row_i, col_i])
                    else 
                        row << King.new(:B, self.board, [row_i, col_i])
                    end
                elsif row_i == 7 
                     if col_i == 0 || col_i == 7
                        row << Rook.new(:W, self.board, [row_i, col_i])
                    elsif col_i == 1 || col_i == 6
                        row << Knight.new(:W, self.board, [row_i, col_i])
                    elsif col_i == 2 || col_i == 5 
                        row << Bishop.new(:W, self.board, [row_i, col_i])
                    elsif col_i == 3 
                        row << Queen.new(:W, self.board, [row_i, col_i])
                    else 
                        row << King.new(:W, self.board, [row_i, col_i])
                    end
                end
            end
            board << row
        end
        return board
    end

    def [](pos)
        board[pos[0]][pos[1]]
    end

    def []=(pos, value)
        board[pos[0]][pos[1]] = value
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == NullPiece.instance
            raise "There is no piece here."
        elsif !self[end_pos] == NullPiece.instance
            raise "The piece cannot be placed here."
        else
            self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
        end
    end

    def print
        board.each do |row| 
            p row.join(" ")
        end
    end
end


board = Board.new
# p board 
# board.move_piece([1,0], [3,0])
# p board
board.print
board.move_piece([1,0], [3,0])
board.print
