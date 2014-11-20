<<<<<<< HEAD
# encoding: utf-8
require_relative 'unicode.rb'
=======
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
class Rook < SlidingPiece

  attr_accessor :move_dir, :rep

  def move_dir
    [
    [1,0],
    [0,1],
    [-1,0],
    [0,-1]
    ]
  end

  def initialize(pos, color, board)
    super(pos, color, board)
    @board = board.board
<<<<<<< HEAD
    @rep = (color == :b ? "\u265C".encode('utf-8') : "\u2656".encode('utf-8'))
=======
    @rep = (color == :black ? 'R' : 'r')
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end
end
