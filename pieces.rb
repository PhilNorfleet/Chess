

class Piece
<<<<<<< HEAD

  attr_accessor :color, :rep, :pos

=======
  attr_accessor :color, :rep, :pos
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board.board
    @first_move = true
<<<<<<< HEAD
    @board[pos[0]][pos[1]] = self
    
=======

    @board[pos[0]][pos[1]] = self
  end

  def make_move

>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end

  def inspect
   return {color: color, pos: pos, class: self.class.to_s}.inspect
  end

<<<<<<< HEAD
=======


>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  def valid_move?(pos) #pos= [x,y]
    x,y = pos
    if [x,y].any?{|i| !i.between?(0,7)}
      return false
    end
<<<<<<< HEAD
=======

>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
    if @board[x][y].nil?
      return true
    elsif @board[x][y].color == self.color
      return false
    else
      return true
    end
  end

<<<<<<< HEAD



=======
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
end
