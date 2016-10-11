class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def display_card
    "#{@value} of #{suit}"
  end
end

class Deck
  def initialize
    @cards = []
    suits = [:diamonds, :hearts, :clubs, :spades]
    suits.each do |suit|
      (2..14).each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end

def count
  @cards.count
end

def shuffle
  @cards.shuffle
end

def deal
  @cards.shift.display_card
end

def display_deck
  @cards.map do |card|
    card.display_card
  end
end

class Hand
  attr_accessor :cards_in_hand

  def initialize
    @cards_in_hand = []
  end
end

class Game
  def get_player_move
    puts '(h)it or (s)tay?'
    player_move = gets.chomp.downcase
  end

  def run
    deck = Deck.new
    deck.shuffle

    player = Hand.new
    dealer = Hand.new

    2.times do
      player.add_to_hand(deck.deal_card)
      dealer.add_to_hand(deck.deal_card)
    end

    puts 'Your hand:'
    player.cards_in_hand.each do |card|
      card
    end

    puts 'Dealer hand:'
    puts 'Unknown'
    dealer.cards_in_hand[1]
  end
end
