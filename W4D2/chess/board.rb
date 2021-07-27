require_relative "piece.rb"

class Board

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

end

board = Board.new
p board