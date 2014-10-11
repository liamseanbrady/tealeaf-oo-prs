# Problem Scope:

# Create an object-oriented Paper Rock Scissors game that includes two players.

# Requirements:

# 1. Two players in the game (human and computer)
# 2. Human picks a hand shape to represent Paper, Rock, or Scissors
# 3. Computer gets assigned a hand shape
# 4. Compare the hand shapes. Either a hand shape wins (p > r, r > s, s > p), or it is a tie.

# Code:

class Hand
  attr_reader :shape

  def initialize(s)
    @shape = s
  end
end

class Player
  attr_accessor :choice, :hand_shape
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    puts "Player's name is #{name}"
  end
end

class Human < Player
  def choose_hand_shape
    puts "Choose one: (P/R/S)"
    self.choice = gets.chomp
    if self.verify_choice
      self.hand_shape = Hand.new(choice).shape
    else
      self.choose_hand_shape
    end
  end

  def verify_choice
    ["p", "r", "s"].include?(choice.downcase)
  end

  def to_s
    puts "Player's name is #{name} and their shape is #{self.choice}"
  end
end

class Computer < Player
  def choose_hand_shape(hand_shapes)
    self.choice = hand_shapes.sample
    self.hand_shape = Hand.new(choice).shape
  end

  def to_s
    puts "Computers name is #{name}"
  end
end

class Game
  HAND_SHAPES = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

  attr_reader :human, :computer

  def initialize
    @human = Human.new("Ingin")
    @computer = Computer.new("C3P0")
  end

  def play
    human.choose_hand_shape
    computer.choose_hand_shape(HAND_SHAPES.keys)
    puts players_picks(human.hand_shape, computer.hand_shape)
    puts describe_hand_shape_rel(human.hand_shape, computer.hand_shape)
    puts compare_hand_shapes(human.hand_shape, computer.hand_shape)
    self.play_again? ? self.play : exit
  end
  
  def players_picks(h_shape, c_shape)
    "You picked #{HAND_SHAPES[h_shape]} and Computer picked #{HAND_SHAPES[c_shape]}"
  end

  def describe_hand_shape_rel(h_shape, c_shape)
    if tie?(h_shape, c_shape)
      "#{HAND_SHAPES[h_shape]} and #{HAND_SHAPES[c_shape]} negate each other"
    elsif h_shape == "p" && c_shape == "r" || c_shape == "p" && h_shape == "r"
      "Paper wraps Rock!"
    elsif h_shape == "r" && c_shape == "s" || c_shape == "r" && h_shape == "s"
      "Rock crushes Scissors"
    elsif h_shape == "s" && c_shape == "p" || c_shape == "s" && h_shape == "p"
      "Scissors cuts Paper"
    end
  end

  def compare_hand_shapes(h_shape, c_shape)
    if tie?(h_shape, c_shape)
      "It's a tie!"
    elsif player_won?(h_shape, c_shape)
      "You won!"
    else
      "You lost!"
    end
  end

  def tie?(h_shape, c_shape)
    h_shape == c_shape
  end

  def player_won?(h_shape, c_shape)
    h_shape == "p" && c_shape == "r" || h_shape == "r" && c_shape == "s" || h_shape == "s" && c_shape == "p"
  end

  def play_again?
    puts "Play again? (Y/N)"
    decision = gets.chomp
    decision.downcase == "y"
  end
end

game = Game.new.play


# Should create a game
# Should allow the game to begin
# Should give human name attribute
# Should make human choose a hand shape
# Should make computer choose a hand shape
# Should include HAND_SHAPES constant for p, r and s, matched to Paper, Rock, Scissors
# Should decide if player has won, lost, or tied
# Should print what human and computer picked
# Should print what shape won





