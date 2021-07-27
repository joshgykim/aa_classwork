require_relative "piece.rb"

class Board

    attr_reader :board

    def initialize
        @board = start_board
    end

    def start_board
        board = Array.new(8) { Array.new(8) { "P" } }
        board.each_with_index do |row, i|
            if i > 1 && i < 6
                row.map! { |ele| ele = "_" } 
            end
        end
        board
    end

    def [](pos)
        board[pos[0]][pos[1]]
    end

    def []=(pos, value)
        board[pos[0]][pos[1]] = value
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == "_"
            raise "There is no piece here."
        elsif !self[end_pos] == "_"
            raise "The piece cannot be placed here."
        else
            self[end_pos], self[start_pos] = self[start_pos], "_"
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
