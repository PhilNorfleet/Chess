# encoding: utf-8
class Queen < SlidingPiece
  attr_accessor :rep

  def move_dir
    [
    [1,0],
    [0,1],
    [-1,0],
    [0,-1],
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
    ]
  end

  def initialize(pos, color, board)
    super(pos, color, board)
    @rep = (color == :b ? "\u265B".encode('utf-8') : "\u2655".encode('utf-8'))
  end
end
