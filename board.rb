require 'byebug'
require 'colorize'
class Board

  attr_accessor :board

  def initialize(empty = false)
    @board = Array.new(8) { Array.new(8) }
    init_pieces unless empty
  end

  def init_pieces
    p 'init_pieces'
    piece_class = Piece
    [:b,:w].each_with_index do |color,r|
      [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_class, i|
        piece_class.new([(r*7), i], color, self)
        color == :w ? x = 6 : x = 1
        Pawn.new([x,i],color,self)
      end
    end
  end

  def black_king
    b_pieces.find { |piece| piece.class == King }
  end

  def white_king
    w_pieces.find { |piece| piece.class == King }
  end

  def inspect
    self.object_id
  end

  def [](pos)
    @board[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    @board[pos[0]][pos[1]] = piece
  end

  def add_piece(piece, pos)
    raise InputError.new 'position not empty' unless self[pos].nil?

    self[pos] = piece
  end


  def move(start_pos,end_pos)
    #byebug

    if @board[start_pos[0]][start_pos[1]].nil?
      raise InputError.new'There is no piece here'
    end
    piece = @board[start_pos[0]][start_pos[1]]
    if piece.moves.include?(end_pos)
      if !(moving_into_check?(start_pos, end_pos))
        @board[start_pos[0]][start_pos[1]] = nil
        @board[end_pos[0]][end_pos[1]] = piece
        piece.pos = end_pos
      else
        raise InputError.new 'This move puts you in check, choose another'
      end
    else
      raise InputError.new 'Cannot move that piece to that position.'
    end

    self.render
  end

  def moving_into_check?(start_pos,end_pos)
    dupped = self.deep_dup
    color = dupped[start_pos].color
    piece = dupped[start_pos]
    dupped[end_pos] = piece
    dupped[start_pos] = nil
    piece.pos = end_pos

    dupped.in_check?(color)
  end

  def in_check?(color)

    opp_pieces = (color == :b ? w_pieces : b_pieces)
    our_king_pos = (color == :b ? self.black_king.pos : self.white_king.pos)
    opp_pieces.each do |opp_piece|
      return true if opp_piece.moves.include?(our_king_pos)
    end
    false
  end

  def checkmate?

    white_mated = false
    black_mated = false
    w_pieces.each do |piece|


      if piece.moves.all? { |move| moving_into_check?(piece.pos,move)}

        white_mated = true
      else
        white_mated = false
        break
      end
    end
    b_pieces.each do |piece|
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

    deep_copy = Board.new(true)
    @board.each_with_index do |row,i|
      row.each_with_index do |piece,j|
        deep_copy.board[i][j] = piece.class.new([i,j],piece.color,deep_copy) unless piece.nil?
      end
    end
    deep_copy
  end

  def pieces
    @board.flatten.compact
  end

  def b_pieces
    pieces.select { |piece| piece.color == :b }
  end

  def w_pieces
    pieces.select { |piece| piece.color == :w }
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
            print "  ".colorize(:background => :white)
          else
            print "#{piece.rep} ".colorize(:background => :white)
          end
        else
          flip *= -1
          if piece.nil?
            print "  ".colorize(:background => :light_grey)
          else
            print "#{piece.rep} ".colorize(:background => :light_grey)
          end
        end
      end
      puts
    end
    puts "  a b c d e f g h"
    nil
  end


end
