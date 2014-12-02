class InputError < StandardError
end

class HumanPlayer

  attr_reader :color

  def initialize(color,board)
    @color = color
    @board = board
  end

  def get_input

    color == :b ? team = 'Black' : team = 'White'
    puts "Hey, #{team} player, make your move!"
    input = gets.chomp
    if (input =~ /[a-h][1-8][\s][a-h][1-8]/) != 0
      raise InputError.new "Bad input. example: 'g1 f3' moves piece at g3 to f3"
    end
    parsed = parse_input(input)
    if @board[parsed[0]].nil?
      raise InputError.new "There is no piece there, choose again"
    end
    if @board[parsed[0]].color != color
      raise InputError.new "You chose the wrong color piece, choose again"
    end

    parsed
  end

  def parse_input(input)
    hash = PARSE_HASH
    in_arr = input.split('')
    x = input[1]
    y = input[0]
    i = input[-1]
    j = input[-2]

    [
      [hash[x], hash[y]],
      [hash[i], hash[j]]
    ]
  end

  PARSE_HASH = {
    'a' => 0,
    'b' => 1,
    'c' => 2,
    'd' => 3,
    'e' => 4,
    'f' => 5,
    'g' => 6,
    'h' => 7,
    '1' => 7,
    '2' => 6,
    '3' => 5,
    '4' => 4,
    '5' => 3,
    '6' => 2,
    '7' => 1,
    '8' => 0
  }

end
