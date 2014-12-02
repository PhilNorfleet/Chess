class Game


  attr_reader :w_player, :b_player, :move, :moved_piece

  def initialize

    @board = Board.new
    @board.render
    @w_player = HumanPlayer.new(:w,@board)
    @b_player = HumanPlayer.new(:b,@board)
    @move = nil
    @moved_piece = nil
  end

  def inspect
  end

  def get_move(player)

    @move = player.get_input

    @moved_piece = @board[move[0]]
  end


  def play

    winner = nil
    until @board.checkmate?
      [@w_player,@b_player].each do |player|
        begin
          get_move(player)
          x, y = @move
          @board.move(x,y)
          if @board.checkmate?
            player.color == :b ? winner = 'Black' : winner = 'White'
            break
          end
        rescue InputError => e
          puts "#{e.message}"
          retry
        end
      end
    end
    puts "#{winner} wins!!"
  end

end
