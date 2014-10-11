# Problem Scope:

# Create an object-oriented Paper/Rock/Scissors game.

# Requirements:

# 1. The game involves two players.
# 2. Both players pick a hand shape from Paper, Rock, or Scissors.
# 3. Either there is a winner (p > r, r > s, s > p) or it is a tie.
# 4. The winner is decided and the game ends.

class Hand
  attr_accessor :shape

  def initialize(s)
    self.shape = s
  end

  def to_s
    puts "This hand's shape is #{self.shape}"
  end
end

class Player
  attr_accessor :choice, :hand
  attr_reader :name

  def initialize(n)
    @name = n
  end
end

class Human < Player
  def pick_hand_shape(choices)
    puts "Choose one: (P/R/S)"
    self.choice = Hand.new(gets.chomp).shape
  end
end

class Computer < Player
  def pick_hand_shape(choices)
    self.choice = Hand.new(choices.keys.sample).shape
  end
end

class Game
  CHOICES = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}
  attr_reader :player, :computer

  def initialize
    @player = Human.new("Ingin")
    @computer = Computer.new("C3PO")
  end

  def play
    player.pick_hand_shape(CHOICES)
    computer.pick_hand_shape(CHOICES)
    display_choices(player.choice, computer.choice)
    display_winning_choice(player.choice, computer.choice)
    display_winner(player.choice, computer.choice)
    play_again?
  end

  def display_choices(p_choice, c_choice)
    puts "Player picked #{CHOICES[p_choice]} and Computer picked #{CHOICES[c_choice]}"
  end

  def display_winning_choice(p_choice, c_choice)
    if paper_and_rock?(p_choice, c_choice)
      puts "Paper wraps rock"
    elsif rock_and_scissors?(p_choice, c_choice)
      puts "Rock crushes scissors"
    elsif scissors_and_paper?(p_choice, c_choice)
      puts "Scissors cuts paper"
    end
  end

  def paper_and_rock?(p_choice, c_choice)
    p_choice == "p" && c_choice == "r" || c_choice == "p" && p_choice == "r"
  end

  def rock_and_scissors?(p_choice, c_choice)
    p_choice == "r" && c_choice == "s" || c_choice == "r" && p_choice == "s"
  end

  def scissors_and_paper?(p_choice, c_choice)
    p_choice == "s" && c_choice == "p" || c_choice == "s" && p_choice == "p"
  end

  def display_winner(p_choice, c_choice)
    if tie?(p_choice, c_choice)
      puts "It's a tie!"
    elsif player_won?(p_choice, c_choice)
      puts "#{player.name} won!"
    else
      puts "#{player.name} lost!"
    end
  end

  def tie?(p_choice, c_choice)
    p_choice == c_choice
  end

  def player_won?(p_choice, c_choice)
    p_choice == "p" && c_choice == "r" || p_choice == "r" && c_choice == "s" || p_choice == "s" && c_choice == "p"
  end

  def play_again?
    puts "Play again? (Y/N)"
    if gets.chomp.downcase == 'y'
      self.play
    else
      exit
    end
  end
end

game = Game.new
game.play







