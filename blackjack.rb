##-------------------------------------------------------------------
## BlackJack.rb
##-------------------------------------------------------------------
=begin
1. Shuffle the cards
2. Dealer must stay in 17 if not hit 21 at the first two cards
3.User needs to have a current balance
4. Beat (put the beat in the table)
5. Deal (ask for the cards)
5. At the same time I get my cards the dealer gets his cards
6. I can hit (ask for more cards) or stay 
7. Game should say if you win or not
8. Dealer give you two cards. He stay with two cards, but he only shows one card.
    Dealer let you know if he has black jack before you ask for more cards
Game sample: http://zone.msn.com/gameplayer/gameplayer.aspx?game=blackjack&instance=default
9. User must be able to register
http://zone.msn.com/en/blackjack/

10. About the cards. Review the following link
http://www.mathcs.emory.edu/~cheung/Courses/170/Syllabus/10/deck-of-cards.html

=end
#Game description
#-----------------------------------------------------------

#. User provide his name
#. The system register the new user
#. Ask him if he wants to play

#. Start playing
#-----------------------------------------------------------
#. Player received a money balance to start playing
#. Dealer shuffle the cards
#. User  can chose the amount of money to place the beat
#. User can DEAL (ask for cards) or clear
#. Dealer  deal the cards (one to user, one to dealer, one to user, one to dealer)
#. Dealer check if he has black jack (game ends)
#. User check his cards. If is less than 21, he can ask for more cards. If is 21 he is done (or black jack he wins)
#. User can hit (ask for more cards) or stand
#. If user hit and get more than 21 he is buster (lost)
#. When user "Stand" is the time for the dealer to play
#. Delear max number is 17
#. When dealer is done, he compares his # against player number
#. if player has more cards amount than dealer he wins. Otherwise he lost

#-----------------------------------------------------------

#@userName = ''
#@currentBalance = 1000
    @deck = {"CTwo"=>2, "CThree"=>3, "CFour"=>4, "CFive"=>5,"CSix"=>6, "CSeven"=>7, "CEight"=>8, "CNine"=>9,"CTen"=>10, "CJack"=>10, "CQueen"=>10, "CKing"=>10, "CAce"=>11, 
                 "DTwo"=>2, "DThree"=>3, "DFour"=>4, "DFive"=>5,"DSix"=>6, "DSeven"=>7, "DEight"=>8, "DNine"=>9,"DTen"=>10, "DJack"=>10, "DQueen"=>10, "DKing"=>10, "DAce"=>11, 
                 "HTwo"=>2, "HThree"=>3, "HFour"=>4, "HFive"=>5,"HSix"=>6, "HSeven"=>7, "HEight"=>8, "HNine"=>9,"HTen"=>10, "HJack"=>10, "HQueen"=>10, "HKing"=>10, "HAce"=>11, 
                 "STwo"=>2, "SThree"=>3, "SFour"=>4, "SFive"=>5,"SSix"=>6, "SSeven"=>7, "SEight"=>8, "SNine"=>9,"STen"=>10, "SJack"=>10, "SQueen"=>10, "SKing"=>10, "SAce"=>11 }
      

def start_play
    puts "-----------------------------------"
    print_message("Welcome to Black Jack")
    puts "-----------------------------------"
    print_message("Provide your name")
    userName = gets.chomp
    userBalance = 1000
    currentBeat = 5
    delear_cards = get_shuffle_cards
    keep_playing = 'y'
    shoe_cards = get_shuffle_cards
    
    until keep_playing == 'n'  or keep_playing == 'q' or userBalance == 0
        print_message("Player #{userName} current balance: $#{userBalance} - current beat: $#{currentBeat}")    
        print_message("Menu options: ")
        print_message "<b - beat>"
        print_message "<p - play>"
        print_message "<q - quit>"
        
        user_selection = gets.chomp
        case user_selection
        when 'b'
            print_message "New Beat amount"
            newBeat =gets.chomp
            if newBeat.to_i <= userBalance.to_i
                currentBeat = newBeat
            else
                print_message "Not enough balance"
            end
        when 'p'
            userBalance = play  userName,  userBalance, currentBeat , shoe_cards        
             if userBalance > 0            
                print_message("Keep playing? User Balance: #{userBalance}")
                keep_playing = gets.chomp
             else
                print_message("User Balance: #{userBalance}")
                keep_playing = 'n'
             end
        else
            print_message "Not valid option #{user_selection}"
        end
    end
    
    print_message "Game over..."
    ##TODO: Create user_name file to load previous user information
    
    #print_message  "User #{@userName} starts with a balance of $ #{@currentBalance}";
end

def play userName, userBalance, currentBeat, shoe_cards
      print_message "Pick one option #{userName}: (Current beat: #{currentBeat})"
      print_message "<d - deal>"
      print_message "<c - clear>"
      player_cards = []
      dealer_cards = []
      
      action= gets.chomp
      
      begin
      
           if action == 'd'
              deal_cards  player_cards, shoe_cards, 1
              deal_cards  dealer_cards, shoe_cards, 1
              deal_cards  player_cards, shoe_cards, 1
              deal_cards  dealer_cards, shoe_cards, 1
              
             userBalance= play_cards userName, player_cards, dealer_cards, currentBeat, userBalance, shoe_cards              
            action = 'c'
          end          
      end while action != 'c'  ##end of while
     
            
     #puts shoe_cards
     return userBalance
end
#-------------------------------------------------------------------
def play_cards userName, player_cards, dealer_cards, currentBeat, userBalance, shoe_cards
    
    begin
        player_total = get_cards_amount player_cards
        dealer_total = @deck[dealer_cards[0].to_s]
        print_message "#{userName}  cards: #{player_cards.to_s} - Total: #{player_total}"
        print_message "Dealer cards: #{dealer_cards[0].to_s} - Total : #{dealer_total}"
        #userBalance= check_user_wins userName, player_total, dealer_total, player_cards, userBalance, currentBeat, action
        action = get_new_action  player_total, dealer_total, player_cards
         if action != '' 
           userBalance= get_user_balance userName, player_total, dealer_total, player_cards, userBalance, currentBeat, action
           print_message "#{userName} #{action} "
           action = 'q'
        end          
        
        if action != 's' and action != 'q'
            print_message "Actions:  h (hit) or s (stand)"
            action = gets.chomp
            if action == 'h'
                deal_cards  player_cards, shoe_cards, 1
            elsif action == 's'
                dealer_total= dealer_plays  player_total, dealer_cards,  shoe_cards
                action = get_new_action  player_total, dealer_total, player_cards
                if action != '' 
                     userBalance= get_user_balance userName, player_total, dealer_total, player_cards, userBalance, currentBeat, action
                     print_message "#{userName} #{action} "
                 elsif action == ''
                 if(player_total >dealer_total)
                        print_message "#{userName} wins"
                        userBalance= userBalance + currentBeat
                  elsif player_total == dealer_total
                        print_message "#{userName} ties"
                  end                    
                end
                action = 's'
            end ## end of action == 's'
        end ##end of actions  action != 's' and action != 'q'
        
        
    end while   action != 's' and action != 'q'##
        print_message "*************RESULTS*************"
        dealer_total =  get_cards_amount dealer_cards
        print_message "#{userName}  cards: #{player_cards.to_s} - Total: #{player_total}"
        print_message "Dealer cards: #{dealer_cards.to_s} - Total : #{dealer_total}"
        print_message "*************GAME DONE*************"
    return userBalance
end
#-------------------------------------------------------------------
def dealer_plays  player_total, dealer_cards,  shoe_cards
        dealer_total =   get_cards_amount dealer_cards
        begin
            deal_cards  dealer_cards, shoe_cards, 1
            dealer_total =   get_cards_amount dealer_cards
        end while dealer_total <= 17 ##end of while
        
        return dealer_total
end
#-------------------------------------------------------------------
def  get_user_balance userName, player_total, dealer_total, player_cards, userBalance, currentBeat, action
     if player_total > 21
                userBalance = userBalance.to_i - currentBeat.to_i
            elsif dealer_total > 21
                userBalance = userBalance.to_i + currentBeat.to_i
            elsif has_blackJack player_cards
                 userBalance = userBalance.to_i + currentBeat.to_i
            elsif(player_total == 21 and dealer_total < 21)
                userBalance = userBalance.to_i + currentBeat.to_i
           elsif(player_total >dealer_total)
                        userBalance= userBalance.to_i + currentBeat.to_i
            elsif(player_total < dealer_total)
                    userBalance= userBalance.to_i - currentBeat.to_i
            end
             return userBalance
end

#-------------------------------------------------------------------
def  get_new_action  player_total, dealer_total, player_cards  
    action = ''
     if player_total > 21
        action = 'buster'
    elsif dealer_total > 21
         action = 'dealer buster. You win'
    elsif has_blackJack player_cards
          action = 'blackJack'
    elsif(player_total == 21 and dealer_total < 21)
        action = 'wins'
     end
     return action
end

#-------------------------------------------------------------------
def deal_cards  user_cards, shoe_cards, amount_of_cards
    begin
        user_cards.push(shoe_cards.pop)
        amount_of_cards = amount_of_cards - 1
    end while amount_of_cards > 0
end
#-------------------------------------------------------------------
def has_blackJack cards
    is_black_jack = false
    
    if  cards.length  == 2
        card1 = cards[0]
        card2 = cards[1]
        if  ( (is_As card1 or is_As card2)  and  (is_Jack  card1 or is_Jack card2))
            is_black_jack = true
        end
    end
    return is_black_jack
end
#-------------------------------------------------------------------
def  is_As card
     isAs = false
     if card.gsub("ACE").count > 0
        isAs = true
     end
     return isAs
end
#-------------------------------------------------------------------
def  is_Jack card
     isJack = false
     if card.gsub("Jack").count > 0
        isJack = true
     end
     return isJack
end
#-------------------------------------------------------------------
def get_cards_amount cards
        @deck.values_at(*cards).inject {|sum, n| sum + n } 
end
#-------------------------------------------------------------------
def get_shuffle_cards
      cards= @deck.keys.shuffle
      return cards
end

#-------------------------------------------------------------------
def print_message (msg)
        puts "BJ=> #{msg}"
end

def test_shuffle
        player_cards = []
        dealer_cards = []      
        shoe_cards= @deck.keys.shuffle
         deal_cards  player_cards, shoe_cards, 2
         deal_cards  dealer_cards, shoe_cards, 2
         
         puts @deck["HThree" ]
         puts  @deck.values_at(player_cards)
         print_message @deck.values_at("HThree", "SJack")
         print_message player_cards[0].to_s
         print_message @deck.values_at(player_cards[0].to_s)
         puts "Last value: "
         print_message @deck.values_at(*player_cards)
         puts "Sum of the values: "
         print_message @deck.values_at(*player_cards).inject {|sum, n| sum + n } 
end
#-------------------------------------------------------------------
#start_play
#load_deck
start_play
#test_shuffle

