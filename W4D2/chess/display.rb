require_relative "cursor.rb"
require_relative "board.rb"
require "colorize"

class Display

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end
    
end