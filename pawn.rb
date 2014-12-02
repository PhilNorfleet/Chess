
# encoding: utf-8
require_relative 'unicode.rb'

class Pawn < Piece

  attr_accessor :rep

  def moves

    poss_moves = move_dir

    good_moves = []

    w,x,y,z = poss_moves

    piece_row, piece_col = @pos

    non_capture = [w,x]

    capture = [y,z]

    if @board[[w[0]+@pos[0],@pos[1]]].nil?

       good_moves << [w[0]+@pos[0],@pos[1]]
       if @first_move && @board[[x[0]+@pos[0],@pos[1]]].nil?

         good_moves << [x[0]+@pos[0],@pos[1]]
       end
    end

    capture.each do |i|
      d_row,d_col = i
      n_row = piece_row+d_row
      n_col = piece_col+d_col
      if !@board[[n_row,n_col]].nil? && @board[[n_row,n_col]].color != self.color
        good_moves << [n_row,n_col]
      end
    end

    good_moves
  end

  def move_dir

    b_direction = [

      [1,0],
      [2,0],
      [1,1],
      [1,-1]
    ]
    w_direction = [

      [-1,0],
      [-2,0],
      [-1,1],
      [-1,-1]

    ]

    return (self.color == :w ? w_direction : b_direction)


  end


  def initialize(pos, color, board)
    super(pos, color, board)
    @board = board

    @rep = (color == :b ? "\u265F".encode('utf-8') : "\u2659".encode('utf-8'))

  end

end
