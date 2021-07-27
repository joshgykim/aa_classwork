require_relative "piece.rb"

class Board

    attr_reader :board

    def initialize
        @board = start_board
    end

    def start_board
        board = Array.new(8) { Array.new(8) { Piece.new } }
        board.each_with_index do |row, i|
            if i > 1 && i < 6
                row.map! { |ele| ele = nil } 
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
        if self[start_pos].nil?
            raise "There is no piece here."
        elsif !self[end_pos].nil?
            raise "The piece cannot be placed here."
        else
            self[end_pos], self[start_pos] = self[start_pos], nil
        end
    end

end
