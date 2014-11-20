class Game

<<<<<<< HEAD
  attr_reader :w_player, :b_player, :move, :moved_piece
=======
>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  def initialize
    @board = Board.new
    @board.render
<<<<<<< HEAD
    @w_player = HumanPlayer.new(:w)
    @b_player = HumanPlayer.new(:b)
    @move = nil
    @moved_piece = nil
  end

  def inspect
  end

  def get_move(player)
    @move = player.get_input
    @moved_piece = @board.board[move[0][0]][move[0][1]]
  end
=======
    @white_player = HumanPlayer.new(:white)
    @black_player = HumanPlayer.new(:black)
  end

>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc

  def play
    winner = nil
    until @board.checkmate?
<<<<<<< HEAD
      [@w_player,@b_player].each do |player|
        begin
          get_move(player)
          until !moved_piece.nil?
            print "You chose an empty spot"
            puts
            get_move(player)
          end
          until player.color == moved_piece.color
            print "You chose the wrong color piece"
            puts
            get_move(player)
          end
          @board.move(@move[0],@move[1])
          if @board.checkmate?
            player.color == :b ? winner = 'Black' : winner = 'White'
            break
          end
        rescue ArgumentError => e
          puts "#{e.message}"
          retry
        end
      end
    end
    puts "#{winner} wins!!"
  end


=======

      white_move = @white_player.play_turn
      until @board.board[white_move[0][0]][white_move[0][1]].color == @white_player.color
        print "Wrong color idiot"
        puts
        white_move = @white_player.play_turn
      end
      @board.move(white_move[0],white_move[1])
      if @board.checkmate?
        winner = :white
        break
      end
      black_move = @black_player.play_turn
      until @board.board[black_move[0][0]][black_move[0][1]].color == @black_player.color
        print "Wrong color idiot"
        puts
        black_move = @black_player.play_turn
      end
      @board.move(black_move[0],black_move[1])
      if @board.checkmate?
        winner = :black
        break
      end
    end
    puts "#{winner.to_s} wins!!"
  end

>>>>>>> 4ecbfd4526058641852456a7e187b7749536bedc
end
