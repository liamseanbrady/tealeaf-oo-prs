# - Requirements:

# Create an object-oriented Paper Rock Scissors game
# Player should move first; computer moves second
# Make a decision of whose the winner based on a pre-defined set of what item beats what
# Someone must win or it is a draw
# Player should be able to choose to play again after the game has finished
# Can choose from Paper, Rock or Scissors

# - Nouns and Verbs

# Nouns: Player, Computer, Paper, Rock, Scissors, Game, Items, PaperRockScissors
# Verbs: move, choose, finish, play, play again, decide winner, beat, win, draw

# - Expected Output:

# Welcome message
# Choose one: (P/R/S)
# p
# You pick Paper and computer picked Rock
# Paper wraps Rock!
# You won
# Play again? (Y/N)
# n
# exit game

# - Game Flow:

# 1. Both players pick paper, rock or scissors
# 3. Decide who the winner is, or whether it is a tie. p > r, r > s, s > p
# 3. Ask the player if the would like to play again

# - Classes

# Player
# Hand


# - Instance Methods



# Code

class Hand
  attr_reader :shape

  def initialize(shape)
    @shape = shape
  end

  def to_s
    "The shape of this hand is #{self.shape}"
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
  def pick_hand(choices)
    puts "Choose one: (P/R/S)"
    choice = gets.chomp
    self.hand = Hand.new(choice).shape
  end
end

class Computer < Player
  def pick_hand(choices)
    self.choice = choices.keys.sample
    self.hand = Hand.new(choice).shape
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
    player.pick_hand(CHOICES)
    computer.pick_hand(CHOICES)
    puts "Player picked #{CHOICES[player.hand]} and Computer picked #{CHOICES[computer.hand]}"
    puts compare_hands(self.player, self.computer)
  end

  def compare_hands(p1, p2)
    if p1.hand == p2.hand
      "It's a tie!"
    elsif p1.hand == "p" && p2.hand == "r"
      "#{p1.name} won"
    elsif p1.hand == "r" && p2.hand == "s"
      "#{p1.name} won"
    elsif p1.hand == "s" && p2.hand == "p"
      "#{p1.name} won"
    end
  end
end

game = Game.new.play







