# encoding: utf-8
require_relative 'unicode.rb'

class Rook < SlidingPiece

  attr_accessor :rep

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
    @rep = (color == :b ? "\u265C".encode('utf-8') : "\u2656".encode('utf-8'))
  end
end
