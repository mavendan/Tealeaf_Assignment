 ##---------------------------------------------------------------
 ## gameprsOOP.rb
 ## OOP: Paper - Rock - Scissors!!
##*****************************************************************************
 class  GameRules
        
        attr_accessor :action, :name
        
        def initialize name
             @actions_list =  ["p", "r", "s"]
             self.name = name
        end
       
        def self.show_winner (user1,  user2)
                if  (user1.action == "p" && user2.action == "r") or (user1.action == "r" && user2.action == "s") or (user1.action == "s" && user2.action == "p")
                    puts "#{user1.name} won!!"
                elsif  user1.action == user2.action
                    puts "is a tie!!"  
                else
                    puts "#{user2.name} won!!"
                end
                puts "You picked  #{get_selection_full_name(user1.action)} and computer picked #{get_selection_full_name(user2.action)}\n"
        end
        
        ##---------------------------------------------------------------
        def self.get_selection_full_name selection
            full_name = ""
            case selection
             when  "p"
                full_name = "Paper"
             when "r"
                full_name = "Rock"
              when "s"
                full_name = "Scissors"
              else
                full_name = "NOT SELECTED"
              end ##end of case
            return full_name
        end
    
    
 end ## Game class ended
##*****************************************************************************
 class Computer < GameRules
        def initialize
                super("Computer")
        end
        def generate_action
            self.action= @actions_list.sample
            #puts "computer selected #{self.action}"
        end
        
 end
##*****************************************************************************
 class User < GameRules
    def initialize
       super("Player")
    end
    def set_action
        begin
            puts "Chose one (p/r/s):"
            self.action = gets.chomp
        end while   @actions_list.select{ |item| action  == item}.count() == 0
    end
 end
##*****************************************************************************
 class Game
      
      def initialize
          @computer = Computer.new
          @user = User.new 
      end
 
        def begin_game
            puts "****************************************"
            puts "Play Paper - Rock - Scissors!! "
            puts "****************************************"
            begin
                @computer.generate_action
                @user.set_action
                GameRules.show_winner @user,  @computer
                
                puts "Play again? (y | n)?"
                option = gets.chomp
            end  while option != 'n'   ##End of While method
        puts "Game over..."
        end
 end
 ##*****************************************************************************
 
     game = Game.new
     game.begin_game
