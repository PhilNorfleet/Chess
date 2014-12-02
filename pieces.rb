class Piece

  attr_accessor :color, :rep, :pos

  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
    @first_move = true
    @board[@pos] = self
  end

  def inspect
   return { color: color, pos: pos, class: self.class.to_s }.inspect
  end

  def valid_move?(pos)
    if pos.any?{ |i| !i.between?(0,7) }
      return false
    end
    if @board[pos].nil?
      return true
    elsif @board[pos].color == self.color
      return false
    else
      return true
    end
  end

end
