    ##---------------------------------------------------------------
    ## PaperRockScissors.rb
    ## Second assignment on the tealeaf Ruby course    
    ##---------------------------------------------------------------
	
    #3.times  do
      #  puts Random.new.rand(3)
      #  puts "other \n"
      #  puts  1 + Random.rand(3)
      #  puts "\n"
	#end
 ##---------------------------------------------------------------
    @game_operations = ["p", "r", "s"]
 
    def  game_start
        puts "Play Paper - Rock - Scissors!! \n"
        
        begin
            puts "Chose one (p/r/s):"
            option = gets.chomp
            play option 
            puts "Play again? (y | n)?"
            option = gets.chomp
           
        end while option != 'n'   ##End of While method
        puts "Game over..."
    end
    ##---------------------------------------------------------------
    def play user_selection
         computer_selection = get_computer_option
         puts "You picked  #{get_selection_full_name(user_selection)} and computer picked #{get_selection_full_name(computer_selection)}\n"
         if user_selection == computer_selection
            puts "It's a tie \n"            
         else
             winner = who_won(user_selection, computer_selection)
             puts "#{winner} won!!"
          end
    end
    ##---------------------------------------------------------------
    def who_won (you, computer)
        winner = "";
        if  (you == "p" && computer == "r") or (you == "r" && computer == "s") or (you == "s" && computer == "p")
            winner = "You"
        else
            winner = "Computer"
        end
        return winner
    end
    ##---------------------------------------------------------------
    def get_computer_option
            selection =  @game_operations[Random.new.rand(3)]
            return selection
    end
    ##---------------------------------------------------------------
    def get_selection_full_name selection
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
        
     ##---------------------------------------------------------------
     ## Start the application
     ##---------------------------------------------------------------
     game_start