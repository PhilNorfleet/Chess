

class Board

  attr_accessor :board

  def initialize(empty = false, check_mate = false)
    @board = Array.new(8) { Array.new(8) }
    init_pieces unless empty || check_mate
    init_check_mate_pieces if check_mate
  end

  def init_check_mate_pieces
<<<<<<< HEAD
      Queen.new([0,2],:b, self)
      Rook.new([1,2],:b, self)
      King.new([0,0],:w, self)
      King.new([7,7],:b, self)
=======
      Queen.new([0,2],:black, self)
      Rook.new([1,2],:black, self)
      King.new([0,0],:white, self)
      King.new([7,7],:black, self)
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end

  def init_pieces

    piece_class = Piece
<<<<<<< HEAD
    [:b,:w].each_with_index do |color,r|
      [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_class, i|
        piece_class.new([(r*7), i], color, self)
        color == :w ? x = 6 : x = 1
=======
    [:black,:white].each_with_index do |color,r|
      [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_class, i|
        piece_class.new([(r*7), i], color, self)
        color == :white ? x = 6 : x = 1
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
        Pawn.new([x,i],color,self)
      end
    end
  end

  def black_king
<<<<<<< HEAD
    black_pieces.find { |piece| piece.class == King }
  end

  def white_king
    white_pieces.find { |piece| piece.class == King }
=======
    black_piece.find { |piece| piece.class == King }
  end

  def white_king
    white_piece.find { |piece| piece.class == King }
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end

  def inspect
  end

<<<<<<< HEAD
  def [](pos)
    board



  end




  def move(start_pos, end_pos)
    x,y = start_pos
    raise ArgumentError.new 'There is no piece here' if @board[x][y].nil?
=======

  def move(start_pos,end_pos)
    x,y = start_pos
    raise 'There is no piece here' if board[x][y].nil?
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
    i,j = end_pos
    piece = @board[x][y]
    if piece.moves.include?(end_pos)
      if !(moving_into_check?(start_pos, end_pos))
        @board[x][y] = nil
        @board[i][j] = piece
        piece.pos = [i,j]
      else
<<<<<<< HEAD
        raise ArgumentError.new 'This move puts you in check, choose another'

      end

    else
      raise ArgumentError.new 'Cannot move that piece to that position.'

    end
    self.render
    put "Checkmate!" if checkmate?
=======
        raise 'This move puts you in check, silly'
      end

    else
    raise 'Cannot move that piece to that position'
    end
    self.render
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end

  def moving_into_check?(start_pos,end_pos)
    dupped = self.deep_dup
    x,y = start_pos
    i,j = end_pos
    color = @board[x][y].color
    piece = dupped.board[x][y]
    dupped.board[i][j] = piece
    dupped.board[x][y] = nil
    piece.pos = [i,j]
    dupped.in_check?(color)

  end

  def in_check?(color)

<<<<<<< HEAD
    opp_pieces = (color == :b ? white_pieces : black_pieces)
    our_king_pos = (color == :b ? self.black_king.pos : self.white_king.pos)
=======
    opp_pieces = (color == :black ? white_pieces : black_pieces)
    our_king_pos = (color == :black ? self.black_king.pos : self.white_king.pos)
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

    opp_pieces.each do |opp_piece|
      return true if opp_piece.moves.include?(our_king_pos)
    end

    false

  end


  def checkmate?
    white_mated = false
    black_mated = false
    white_pieces.each do |piece|
      if piece.moves.all? { |move| moving_into_check?(piece.pos,move)}
        white_mated = true
      else
        white_mated = false
        break
      end
    end
    black_pieces.each do |piece|
      if piece.moves.all? { |move| moving_into_check?(piece.pos,move)}
        black_mated = true
      else
        black_mated = false
        break
      end
    end
    black_mated || white_mated
  end

  def deep_dup
    collect = Board.new(true)
    @board.each_with_index do |row,i|
      row.each_with_index do |piece,j|
        collect.board[i][j] = piece.class.new([i,j],piece.color,collect) unless piece.nil?
      end
    end
    collect
  end

  def pieces
    @board.flatten.compact
  end

  def black_pieces
<<<<<<< HEAD
    pieces.select { |piece| piece.color == :b }
  end

  def white_pieces
    pieces.select { |piece| piece.color == :w }
=======
    pieces.select { |piece| piece.color == :black }
  end

  def white_pieces
    pieces.select { |piece| piece.color == :white }
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
  end



  def render
    flip = 1
    row_accum = 8
    @board.each do |row|
      flip *= -1
      print "#{row_accum} "
      row_accum -= 1
      row.each do |piece|
        if flip == 1
          flip *= -1
          if piece.nil?
            print "[ ]"
          else
            print "[#{piece.rep}]"
          end
        else
          flip *= -1
          if piece.nil?
            print "{ }"
          else
            print "{#{piece.rep}}"
          end
        end
      end
      puts
    end
    puts "   a  b  c  d  e  f  g  h"
    nil
  end


end
