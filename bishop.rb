<<<<<<< HEAD
# encoding: utf-8
require_relative 'unicode.rb'
class Bishop < SlidingPiece

  attr_accessor :rep
=======
class Bishop < SlidingPiece
  attr_accessor :move_dir, :rep
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  def move_dir
    [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
    ]
  end

  def initialize(pos, color, board)
    super(pos, color, board)
    @board = board.board
<<<<<<< HEAD
    @rep = (color == :b ? "\u265D".encode('utf-8') : "\u2657".encode('utf-8'))
  end

=======
    @rep = (color == :black ? 'B' : 'b')
  end
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
end
