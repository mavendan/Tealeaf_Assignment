require 'pry'
##---------------------------------------------------------------
## gametttOO.rb (Tick Tack Toe)
## Tick Tac Toe OOP
##---------------------------------------------------------------
class Format
    def print_message msg
        puts "=>#{msg}"
    end
end

#Board (knows how to draw itself and received the values and to tell who wins)
##*********************************************************
class Board < Format
      
      attr_accessor :board
      EMPTY = ' '
      
    def initialize
    
        self.board = [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY]
        @winning_positions = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
        
    end
    ##---------------------------------------------------------------    
    def set_mark  user
    
        if user.action.to_i < 9 && user.action.to_i >= 0
            self.board[user.action.to_i] = user.symbol
        else
            print_message "Invalid position: #{user.action}. Valid range is from 0 to 8"
        end
        
    end    
    ##---------------------------------------------------------------    
    def is_winner user
    
        game_is_done = 0        
        @winning_positions.each  do |position|
            if(self.board.values_at(*position).count(user.symbol) == 3)
                game_is_done = 1                    
            end
        end        
      return game_is_done
      
    end
    ##--------------------------------------------------------------- 
    def is_position_empty position
    
        is_empty = 0
        array_position = self.board[position]
        if array_position == EMPTY
            is_empty = 1
        end
        return is_empty
        
    end
    ##---------------------------------------------------------------
    def to_s
       system "cls"
        puts "     |     |     "     
        puts "  #{self.board[0]}  |  #{self.board[1]}  |  #{self.board[2]}  "     
        puts "-----|-----|-----"
        puts "     |     |     "          
        puts "  #{self.board[3]}  |  #{self.board[4]}  |  #{self.board[5]}  "     
        puts "-----|-----|-----"
        puts "     |     |     "                     
        puts "  #{self.board[6]}  |  #{self.board[7]}  |  #{self.board[8]}  "   
        puts "     |     |     "
    end

end
##*********************************************************
class Player < Format
    
    attr_accessor :name, :action, :symbol
    
    def initialize symbol, name
        self.symbol = symbol
        self.name = name
    end
    ##---------------------------------------------------------------
    def get_automatic_action board
    
        begin
            self.action = Random.new.rand(9)            
        end while (board.board[self.action.to_i] != ' '  )

        return self.action
    end
    ##---------------------------------------------------------------
    def to_s
        print_message "#{self.name} using #{self.symbol}"
    end
    
end
##*********************************************************
class TTT < Format
    attr_accessor :user, :computer
    def initialize
        self.user = Player.new('x', 'Player')
        self.computer = Player.new('o', 'Computer')
        @board = Board.new
    end
    ##---------------------------------------------------------------
    def start_game
        begin
            puts @board.to_s
            puts "Chose a position from 0 to 8 to place a piece: "
            self.user.action= gets.chomp
            if self.user.action != 'q'
                @board.set_mark self.user
                self.computer.get_automatic_action  @board                
                @board.set_mark self.computer                
            end
            puts @board.to_s
            if  (@board.is_winner self.user) == 1
                print_message "#{self.user.to_s} wins!!"
                self.user.action = 'q'
            elsif (@board.is_winner self.computer) == 1
                print_message "#{self.computer.to_s} wins!!"
                 self.user.action = 'q'
            end            
        end while self.user.action != 'q'
        
        print_message "Game over!!"
        
    end
    
end
##*********************************************************

##---------------------------------------------------------------
game = TTT.new
game.start_game