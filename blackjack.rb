class Cards
  attr_reader :suit, :value
  def initialize(suit,value)
    @suit = suit
    @value = value
  end
end

class Deck
  def initialize
    @cards = []
  end
  def make_deck
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..14).each do |value|
        @cards.push(Cards.new(suit, value))
      end
    end
  end
  def shuffle
    @cards.shuffle!
  end
  def draw
    @cards.shift
  end
end



class Hand
  def run
    deck = Deck.new
    deck.shuffle
  end
end


class Player
  #player score, player card, etc.
end


class Dealer
  #computer score, computer card, etc.
end

def sum_hand(hand)
  total = 0
  hand.each do |card|
    total += card.value
  end
  total
end


#build game first, then add player/dealer classes
def run
  deck = Deck.new
  deck.make_deck
  deck.shuffle

  player_card = []
  computer_card = []

  player_card.push deck.draw
  computer_card.push deck.draw

  player_card.push deck.draw
  computer_card.push deck.draw

  player_card.each do |card|
    puts "#{card.value} of #{card.suit.capitalize}"
  end
puts "#{sum_hand(player_card)} total"


puts "Would you like to hit or stay?"
response = gets.chomp.downcase
  if response == "hit" || response == "h"
    player_card.push deck.draw
      player_card.each do |card|
      puts "#{card.value} of #{card.suit.capitalize}"
      puts sum_hand(player_card)
      end
    elsif response == "stay"
      player_card.each do |card|
      puts "Your hand is #{card.value} of #{card.suit}"
      end

  end
  puts sum_hand(player_card)
  if sum_hand(player_card) > 21
    puts "Bust!"
  elsif sum_hand(player_card) == 21
    puts "You win!"
  else
    run

  end
end


#  if computer_card.map <= 16 then deck.draw
#  end
#  if computer_card.map > 16
#    puts "Computer stays."
#  end

# if computer_card.map = 21
# puts "Blackjack! Computer wins."
# if computer_card > 21
# puts "Computer busts. You win."

# if player_card = 21
# puts "Blackjack! You win."
# if player_card > 21
# puts "Bust. Computer wins."

puts "Welcome to Kate's Jacked Game of Blackjack! Would you like to play? y/n"
play = gets.chomp.downcase

if play == "yes" || play == "y"
  run
elsif play == "no" || play == "n"
  puts "Sorry to hear that. Come back when you want to play!"
else
  puts "Kate's Jacked Game of Blackjack doesn't understand. Please enter yes (y) or no (n)."
end
