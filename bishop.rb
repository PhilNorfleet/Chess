
# encoding: utf-8
require_relative 'unicode.rb'
class Bishop < SlidingPiece

  attr_accessor :rep

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
    @rep = (color == :b ? "\u265D".encode('utf-8') : "\u2657".encode('utf-8'))
  end

end
