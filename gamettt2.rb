require 'pry'
    ##---------------------------------------------------------------
    ## gamettt.rb (Tick Tack Toe)
    ## Third assignment on the tealeaf Ruby course    
    ##---------------------------------------------------------------
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @winning_positions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    ##---------------------------------------------------------------
    def start_game
        begin
            print_board_results
            puts "Chose a position from 1 to 9 to place a piece: "
            user_selection= gets.chomp
            if user_selection != 'q'
                play user_selection                
            end
            winner_name = get_winner            
            if winner_name.to_s.length > 1
                print_board_results
                 puts "Game Over #{winner_name} won!!"
                user_selection = 'q'
            end
        end while user_selection != 'q'
    end
     ##---------------------------------------------------------------
    def play user
         if user.to_i < 9 && user.to_i >= 0             
            @board[user.to_i] = 'x'
            computer = get_computer_action user
            @board[computer.to_i] = 'o'
        end
        
    end
    ##---------------------------------------------------------------
    def get_computer_action user_action
            computer = user_action
         begin
            computer = Random.new.rand(9)
            puts computer
         end while (@board[computer.to_i] != ' '  )
         
         return computer
    end
    
        def get_computer_action2 user_action
            computer = user_action
         begin
            computer = Random.new.rand(9)
            puts computer
         end while (@board[computer.to_i] != ' '  )
         
         return computer
    end
    
    
 ##---------------------------------------------------------------   
   def get_winner   
        winner_name = ''       
        if ((win_game ('x')) == 1 )
            winner_name = "you"
        elsif ( (win_game ('o') )== 1)
            winner_name = "computer"
        end
       
   end
  ##---------------------------------------------------------------    
   def win_game mark        
        game_is_done = 0     
        @winning_positions.each  do |position|
                if(@board.values_at(*position).count(mark) == 3)
                    game_is_done = 1                    
                end
        end 
       #puts "GAME IS DONE #{game_is_done.to_s}"        
      return game_is_done
   end
 ##---------------------------------------------------------------
 
    def print_board_results
               ##system "cls"
                puts "     |     |     "     
                puts "  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  "     
                puts "-----|-----|-----"
                puts "     |     |     "          
                puts "  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  "     
                puts "-----|-----|-----"
                puts "     |     |     "                     
                puts "  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  "   
                puts "     |     |     "         
                
    end

        ##---------------------------------------------------------------
    start_game