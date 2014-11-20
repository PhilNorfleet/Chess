<<<<<<< HEAD
# encoding: utf-8
require_relative 'unicode.rb'
class Knight < SteppingPiece
  attr_accessor :rep
=======
class Knight < SteppingPiece
  attr_accessor :rep, :DELTA
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  def move_dir
    [
      [2,1],
      [-2,1],
      [2,-1],
      [-2,-1],
      [1,2],
      [-1,-2],
      [1,-2],
      [-1,2],
    ]
  end

  def initialize(pos, color, board)
    super(pos, color, board)
    @board = board.board
<<<<<<< HEAD
    @rep = (color == :b ? "\u265E".encode('utf-8') : "\u2658".encode('utf-8'))
=======
    @rep = (color == :black ? 'K' : 'k')
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  end
end
