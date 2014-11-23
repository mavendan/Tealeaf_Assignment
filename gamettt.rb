    ##---------------------------------------------------------------
    ## gamettt.rb (Tick Tack Toe)
    ## Third assignment on the tealeaf Ruby course    
    ##---------------------------------------------------------------
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    ##---------------------------------------------------------------
    def start_game
        begin
            print_board_results
            puts "Chose a position from 1 to 9 to place a piece: "
            user_selection= gets.chomp
            if user_selection != 'q'
                play user_selection                
            end
            if (game_finish 'x')== 1               
                print_board_results
                 puts 'Game Over you won!!'
                user_selection = 'q'
            elsif (game_finish 'y') == 1
            print_board_results
                 puts 'Game Over computer won!!'
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
    ##---------------------------------------------------------------
   def game_finish mark
        game_is_done = 0
      if  (line_one_done mark) == 1 or (line_two_done mark) == 1 or (line_three_done mark) == 1
            game_is_done = 1
      elsif (vertical_one mark) == 1 or (vertical_two mark) == 1 or (vertical_three mark) == 1
            game_is_done = 1
       elsif (diagonal_one mark) == 1 or (diagonal_two mark) == 1
            game_is_done = 1
      end
      return game_is_done
   end

    ##---------------------------------------------------------------
    def line_one_done mark
        is_done = 0
          if (@board[0] == @board[1]) and (@board[2] == @board[1]) and (@board[1] == mark)
            is_done = 1
          end
          return is_done
    end
    ##---------------------------------------------------------------
     def line_two_done mark
        is_done = 0
          if (@board[3] == @board[4]) and (@board[5] == @board[3]) and (@board[3] == mark)
            is_done = 1
          end
          return is_done
    end
    ##---------------------------------------------------------------
         def line_three_done mark
        is_done = 0
          if (@board[6] == @board[7]) and (@board[8] == @board[7]) and (@board[7] == mark)
            is_done = 1
          end
          return is_done
    end
    ##---------------------------------------------------------------
     def vertical_one mark
        is_done = 0
          if (@board[0] == @board[3]) and (@board[6] == @board[3]) and (@board[0] == mark)
            is_done = 1
          end
          return is_done
    end
    ##---------------------------------------------------------------
     def vertical_two mark
        is_done = 0
          if (@board[1] == @board[4]) and (@board[7] == @board[1]) and (@board[7] == mark)
            is_done = 1
          end
          return is_done
    end
   ##---------------------------------------------------------------
     def vertical_three mark
        is_done = 0
          if (@board[2] == @board[5]) and (@board[8] == @board[2]) and (@board[8] == mark)
            is_done = 1
          end
          return is_done
    end
       ##---------------------------------------------------------------
     def diagonal_one mark
        is_done = 0
          if (@board[0] == @board[4]) and (@board[8] == @board[0]) and (@board[8] == mark)
            is_done = 1
          end
          return is_done
    end
         def diagonal_two mark
        is_done = 0
          if (@board[2] == @board[4]) and (@board[6] == @board[2]) and (@board[4] == mark)
            is_done = 1
          end
          return is_done
    end
    ##---------------------------------------------------------------
    def print_board_results
                system "cls"
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