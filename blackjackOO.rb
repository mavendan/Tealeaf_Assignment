##-------------------------------------------------------------------
## BlackJackOO.rb
##-------------------------------------------------------------------
module PrintFormat
    def print_message msg
      puts "=>#{msg}"
    end
end

class CardsGame
    
    include PrintFormat
    
    attr_accessor :game_name, :cards_deck
    
    def initialize game_name
      @suites = ['C', 'D', 'H', 'S']
      @numbers = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A' ]
      self.cards_deck = @suites.map { |suite|  @numbers.map{ |number|   Card.new(suite, number,   (get_number_value number), (get_alternate_value number)) }  }.flatten
      self.game_name = game_name
    end
    
    def shuffle
      self.cards_deck= self.cards_deck.shuffle
    end   
       
    #ask for one more card
    def hit       
      card = self.cards_deck.pop
      return card
    end
    
    def get_winner
    end

    def get_number_value number
      value = 1
      if number ==  'J' || number == 'Q' || number == 'K'
        value = 10
      elsif number == 'A'
        value = 11
      else
        value = number.to_i
      end
      return value
    end
    
    def get_alternate_value number
      value = 0
      if number == 'A'
        value = 1
      end
      return value
    end
    
    def welcome_message
      puts "-----------------------------------"
      print_message("Welcome to #{self.game_name}")
      puts "-----------------------------------"
    end
    
    def menu_options player      
      until player.enable_to_play        
        print_message(player.information)    
        print_message("Menu options: ")
        print_message "<b - beat>"
        print_message "<d- deal>"
        print_message "<q - quit>"        
        player.action = gets.chomp        
        
        case player.action        
        when 'b'
          player.set_beat_amount
        when 'd'
          shuffle
          player = play  player , cards_deck        
          if player.balance.to_i > 0            
            print_message("Keep playing? User Balance: #{self.player.balance}")
            player.action = gets.chomp
          else
            print_message("User Balance: #{userBalance}")
            player.action = 'n'
          end
        else
          print_message "Not valid option #{self.player.action}"
        end
      end ##UNTIL END   
      print_message "Game Over"      
    end
    def play player, cards
      puts "NOT IMPLEMENTED"
    end
    
    end ##End class Game

class BlackJack < CardsGame

    attr_accessor :player, :dealer
    
    def initialize
      super 'Black Jack'
      self.player = Player.new
      self.dealer = Player.new      
    end
    
     #ask dealer to start given cards
    def deal
      self.player.receive_card hit 
      self.dealer.receive_card hit 
      self.player.receive_card hit 
      self.dealer.receive_card hit 
    end
    
    def start_game
      welcome_message
      register_users()
      menu_options self.player
    end
  
    def register_users
      self.dealer.name = "Dealer"
      self.player.register
    end
    
    def play player, cards_deck      
      deal 
      game_status      
      begin
        if player.has_blackjack != 1        
          print_message "Actions:  h (hit) or s (stand)"
          player.action = gets.chomp      
          if player.action == 'h' 
            player.receive_card hit 
            if(player.get_current_cards_value > 21)
              player.action = 's'
            end
          elsif player.action == 's'
            dealer_plays
          end
          game_status       
        else
        player.action = 's'
        end
      end while player.action != 's'    
      player = get_winner player
      game_results()
      player.reset
      dealer.reset
      return player
    end
    
    def dealer_plays
      if(self.dealer.get_current_cards_value < 17)
        begin
          self.dealer.receive_card hit 
        end while  self.dealer.get_current_cards_value <= 17 ##end of while 
      end
    end
    
    def game_status
      print_message "-----------------------------------"
      self.player.player_status
      self.dealer.dealer_status
      print_message "-----------------------------------"
    end
    
    def game_results
      print_message "*******************************"
      print_message "Final scores:"
      self.player.player_status
      self.dealer.player_status
      print_message "*******************************"
    end
    
    def get_winner player
      player_total = self.player.get_current_cards_value
      dealer_total = self.dealer.get_current_cards_value
      if player_total > 21 && dealer_total < 21
        player.reduce_from_balance
        print_message "#{player.name} buster"
      elsif dealer_total > 21
        player.add_to_balance
        print_message "Dealer buster. #{player.name} wins!!"
      elsif player_total == dealer_total
        print_message "is a tie!!"
      elsif player_total == 21
        player.add_to_balance
        print_message "Black Jack #{player.name} wins!!"
      elsif player_total > dealer_total
        player.add_to_balance
        print_message "#{player.name} wins!!"
      elsif dealer_total > player_total
        player.reduce_from_balance
        print_message "#{dealer.name} wins!!"      
      end
      return player
    end
    
end ##End class BlackJack

class Player
    
    include PrintFormat
    
    attr_accessor :name, :balance, :current_beat, :action
      
    def initialize
      @cards = Array.new
      self.balance = 1000
      self.current_beat = 5
    end
    
    def register
      print_message("Player name:")
      self.name = gets.chomp
      print_message "#{self.name} is now registered"
    end
    
    def set_beat_amount
      print_message "Amount to beat: "
      beat_amount =gets.chomp
      if beat_amount.to_i <= self.balance.to_i
        self.current_beat = beat_amount
      else
        print_message "Not enough balance"
      end
    end
    
    def receive_card card    
      @cards << card      
    end
    
    def show_cards
      cards_name = " ";
      @cards.each do |card|   cards_name += card.to_s  + "  " end      
      return cards_name
    end
    
    def get_current_cards_value
      return @cards.inject{ |sum, n| sum.to_i + n.to_i  }
    end
    
    def add_to_balance 
      self.balance = self.balance.to_i + self.current_beat.to_i
    end
    
    def reduce_from_balance 
      self.balance = self.balance.to_i - self.current_beat.to_i
    end
    
    def has_blackjack
      is_blackJack = 0
      if get_current_cards_value == 21
        is_blackJack = 1
      end
      return is_blackJack
    end
    
    def enable_to_play
       return self.action == 'n'  || self.action == 'q' || self.balance == 0
    end
    
    def information
      print_message "Player #{self.name} current balance: $#{self.balance} - current beat: $#{self.current_beat}"
    end
    
    def player_status
      print_message "#{self.name}  cards: #{show_cards} - Total: #{get_current_cards_value}"
    end
    
    def dealer_status
      print_message "#{self.name}  cards: #{@cards[0].to_s}  value: #{@cards[0].value.to_s} "
    end
    
    def reset
      @cards.clear
    end
    
end ##End class Player

class Card
    attr_accessor :suite, :number, :value, :second_value
    
    def initialize suite, number, value, second_value
      self.suite = suite
      self.number = number
      self.value = value
      self.second_value = second_value
    end
    
    def to_s
       "#{self.suite}_#{self.number}"
    end
    
    def to_i
      return self.value.to_i
    end
    
end ##End of class Card
#-------------------------------------------------------------------
bj = BlackJack.new
bj.start_game
