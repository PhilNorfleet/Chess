<<<<<<< HEAD
# encoding: utf-8
require_relative 'unicode.rb'
=======
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
class Pawn < Piece

  attr_accessor :rep

  def moves
    poss_moves = move_dir
    good_moves = []
<<<<<<< HEAD
=======
    #poss_moves.take(2).each do |i|
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
    w,x,y,z = poss_moves
    piece_row, piece_column = @pos

    non_capture = [w,x]
    capture = [y,z]

<<<<<<< HEAD


    if @board[w[0]+@pos[0]][@pos[1]].nil?
       good_moves << [w[0]+@pos[0],@pos[1]]
=======
    #p [@pos[0],@pos[1]]
    #p [x[0]+@pos[0],@pos[1]]

    if @board[w[0]+@pos[0]][@pos[1]].nil?
       good_moves << [w[0]+@pos[0],@pos[1]]
       #p @board[x[0]+@pos[0]][x[1]+@pos[1]]
       #puts @board[x[0]+@pos[0]][@pos[1]].nil?
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
       if @first_move && @board[x[0]+@pos[0]][@pos[1]].nil?
         good_moves << [x[0]+@pos[0],@pos[1]]
       end
    end

    capture.each do |i|
      delta_row,delta_column = i
      new_row = piece_row+delta_row
      new_column = piece_column+delta_column
      if !@board[new_row][new_column].nil? && @board[new_row][new_column].color != self.color
        good_moves << [new_row,new_column]
      end
    end
<<<<<<< HEAD
=======
    #p "good_moves = #{good_moves}"
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
    good_moves
  end

  def move_dir
<<<<<<< HEAD
    b_direction = [
=======
    blackness = [
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
      [1,0],
      [2,0],
      [1,1],
      [1,-1]
    ]
<<<<<<< HEAD
    w_direction = [
=======
    whiteness = [
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
      [-1,0],
      [-2,0],
      [-1,1],
      [-1,-1]

    ]
<<<<<<< HEAD
    return (self.color == :w ? w_direction : b_direction)
=======
    return (self.color == :white ? whiteness : blackness)
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  end


  def initialize(pos, color, board)
    super(pos, color, board)
    @board = board.board
<<<<<<< HEAD
    @rep = (color == :b ? "\u265F".encode('utf-8') : "\u2659".encode('utf-8'))
=======
    @rep = (color == :black ? 'P' : 'p')
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end
end
