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
end

class Hand
  attr_accessor :cards_in_hand

  def initialize
    @cards_in_hand = []
  end

  def add_to_hand(dealt_card)
    @cards_in_hand.push(dealt_card)
  end

  def calc_total
    total = 0
    @cards_in_hand.map do |card|
      if card.to_i > 10
        if card.to_i == 14
          card = 11
        else card.to_i = 10
        end
      end
      total += card.to_i
    end
    total
  end
end

class Game
  def get_player_move
    puts '(h)it or (s)tay?'
    player_move = gets.chomp.downcase
  end

  def card_corrector(card)
    if card[0..1].to_i > 10
      card_strings = card.split
      if card_strings[0] == "11"
        card_strings[0] = "J"
      elsif card_strings[0] == "12"
        card_strings[0] = "Q"
      elsif card_strings[0] == "13"
        card_strings[0] = "K"
      else card_strings[0] = "A"
      end
      card = card_strings.join(" ")
    end
    puts card
  end

  def run
    deck = Deck.new
    deck.shuffle

    player = Hand.new
    dealer = Hand.new

    2.times do
      player.add_to_hand(deck.deal)
      dealer.add_to_hand(deck.deal)
    end

    puts 'Your hand:'
    player.cards_in_hand.each do |card|
      card_corrector(card)
    end

    puts 'Dealer hand:'
    puts 'Unknown'
    card_corrector(dealer.cards_in_hand[1])
    puts "Player total: #{player.calc_total}"
  end
end

puts "Welcome to Kate's Jacked Game of Blackjack! Would you like to play? y/n/q"
  user_play = gets.chomp.downcase

  if user_play == "yes" || user_play == "y"
    Game.new.run
  elsif user_play == "no" || user_play == "n"
    puts "Sorry to hear that. Come back when you want to play!"
  else
    puts "Kate's Jacked Game of Blackjack doesn't understand. Please enter (y)es or (n)o or q to quit."
  end

loop do


end
