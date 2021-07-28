require_relative "piece.rb"

class Board

    attr_reader :board

    def initialize
        @board = []
        self.populate
    end

    def populate
        # black_royal_row = [Rook.new(:B, board, [0, 0],
        #                    Knight.new(:B, board, [0, 1],
        #                    Bishop.new(:B, board, [0, 2],
        #                    Queen.new(:B, board, [0, 3],
        #                    King.new(:B, board, [0, 4],
        #                    Bishop.new(:B, board, [0, 5],
        #                    Knight.new(:B, board, [0, 6],
        #                    Rook.new(:B, board, [0, 7]]

        (0..7).each do |row_i|
            row = []
            (0..7).each do |col_i|
                if row_i.between?(2, 5)
                    row << NullPiece.instance
                elsif row_i == 1 
                    row << Pawn.new(:B, board, [row_i, col_i])
                elsif row_i == 6
                    row << Pawn.new(:W, board, [row_i, col_i])
                elsif row_i == 0 
                    if col_i == 0 || col_i == 7
                        row << Rook.new(:B, board, [row_i, col_i])
                    elsif col_i == 1 || col_i == 6
                        row << Knight.new(:B, board, [row_i, col_i])
                    elsif col_i == 2 || col_i == 5 
                        row << Bishop.new(:B, board, [row_i, col_i])
                    elsif col_i == 3 
                        row << Queen.new(:B, board, [row_i, col_i])
                    else 
                        row << King.new(:B, board, [row_i, col_i])
                    end
                elsif row_i == 7 
                     if col_i == 0 || col_i == 7
                        row << Rook.new(:W, board, [row_i, col_i])
                    elsif col_i == 1 || col_i == 6
                        row << Knight.new(:W, board, [row_i, col_i])
                    elsif col_i == 2 || col_i == 5 
                        row << Bishop.new(:W, board, [row_i, col_i])
                    elsif col_i == 3 
                        row << Queen.new(:W, board, [row_i, col_i])
                    else 
                        row << King.new(:W, board, [row_i, col_i])
                    end
                end
            end
            board << row
        end
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
            self[end_pos].position = end_pos
        end
    end

    def print
        board.each do |row| 
            p row
        end
    end
end


# my_board = Board.new
# my_board.move_piece([0,3], [2,3])
# queen = my_board[[2,3]]
# my_board.print

