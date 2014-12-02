# encoding: utf-8
class Knight < SteppingPiece
  attr_accessor :rep

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
    @rep = (color == :b ? "\u265E".encode('utf-8') : "\u2658".encode('utf-8'))
  end
end
