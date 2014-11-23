    ##---------------------------------------------------------------
    ## Calculator.rb
    ## First assignment on the tealeaf Ruby course
    ## This class perform the following maths operations:
    ## add, substract, multiply and divide
    ##---------------------------------------------------------------
    
    
    ##---------------------------------------------------------------
    ## Method: main
    ## Description: Entry point of the application
    ##---------------------------------------------------------------
    def  main()
            main_menu(SHOW_HEADER);
    end
    
    ##---------------------------------------------------------------
    ## Method: main_menu
    ## Description: Shows the calculator options
    ##---------------------------------------------------------------
    def main_menu(withheader)
        if withheader == SHOW_HEADER
            show_header()
         end
        menu_options();
      
      #Start looping
        begin
          operator = gets.chomp
          if operator != 'q'
              case operator
              when "1"
                    add_operation()
               when "2"
                    sub_operation()
                when "3"
                    mult_operation()
                when "4"
                    div_operation()
              else
                print_message("Invalid operation. Try again")
              end ##END OF CASE
            menu_options();
          end ##END OF IF OPERATOR != Q
      end while operator != 'q'  ##END OF BEGIN WHILE
      print_message "Ended calculator..."
    end
    ##---------------------------------------------------------------
    ## Method: add_operation
    ## Description:  perform adding operator
    ##---------------------------------------------------------------
    def add_operation()
        print_message "Write number and press ENTER  to add more or press 'r' to show result"
        result = 0
        add = gets.chomp
        if add != 'r'
            result = add.to_i
        end
        begin
            begin
            add = gets.chomp
            if add != 'r'
                result += add.to_i
            end
            rescue StandardError => e
                print_error_message "Invalid number. Ending Add operation.\n#{e.message}"
                add = 'r'
            end
        end while add.downcase != 'r'
        print_message "Result of adding: #{result.to_s}"
    end
     ##---------------------------------------------------------------
    ## Method: sub_operation
    ## Description:  perform substraction operation
    ##---------------------------------------------------------------
    def sub_operation()
        print_message "Write number and press ENTER  to substract more or press 'r' to show result"
        result = 0
        sub = gets.chomp
        if sub != 'r'
            result = sub.to_i
        end
        begin
            begin
            sub = gets.chomp
            if sub != 'r'
                result -= sub.to_i
            end
            rescue StandardError => e
                print_error_message "Invalid number. Ending Substraction operation.\n#{e.message}"
                sub = 'r'
            end
        end while sub.downcase != 'r'
        print_message "Result of substracting: #{result.to_s}"
    end 
    ##---------------------------------------------------------------
    ## Method: mult_operation
    ## Description:  perform multiplication operation
    ##---------------------------------------------------------------
    def mult_operation()
        print_message "Write number and press ENTER  to multiply more or press 'r' to show result"
        result = 0
        mult = gets.chomp
        if mult != 'r'
            result = mult.to_i
        end
        begin
            begin
            mult = gets.chomp
            if mult != 'r'
                result *= mult.to_i
            end
            rescue StandardError => e
                print_error_message "Invalid number. Ending Multiplication operation.\n#{e.message}"
                mult = 'r'
            end
        end while mult.downcase != 'r'
        print_message "Result of multiplying: #{result.to_s}"
    end 
   
    ##---------------------------------------------------------------
    ## Method: div_operation
    ## Description:  perform division operation
    ##---------------------------------------------------------------
    def div_operation()
        print_message "Write number and press ENTER  to divide more or press 'r' to show result"
        result = 0
        div = gets.chomp
        if div != 'r'
            result = div.to_f
        end
        begin
            begin
            div = gets.chomp
            if div != 'r'
                result /= div.to_f
            end
            rescue StandardError => e
                print_error_message "Invalid number. Ending Division operation.\n#{e.message}"
                div = 'r'
            end
        end while div.downcase != 'r'
        print_message "Result of dividing: #{result.to_s}"
    end 
   
    ##---------------------------------------------------------------
    ## Method: show_header
    ## Description:  shows the header of the application
    ##---------------------------------------------------------------
    def show_header()
        print_message (SPACE_SEPARATOR)
        print_message 'Welcome to Ruby Calculator'
        print_message (SPACE_SEPARATOR) 
    end
    ##---------------------------------------------------------------
    ## Method: menu_options
    ## Description:  shows available operations
    ##---------------------------------------------------------------
    def menu_options()
      print_message 'Select operation to perform'
      print_message '1. Add'
      print_message '2. Substract'
      print_message '3. Multiply'
      print_message '4. Divide'
      print_message "Or press 'q' to exit calculator app"
    end
    ##---------------------------------------------------------------
    ## Method: print_message
    ## Description:  Print standard messages into console as string
    ## Parameters:
    ##  msg: message to be displayed
    ##---------------------------------------------------------------
    def print_message(msg)
        print ">> #{msg.to_s} \n"
    end
    ##---------------------------------------------------------------
    ## Method: print_error_message
    ## Description:  print message with error format
    ## into the console as an string
    ## Parameters:
    ## msg: message to be displayed
    ##---------------------------------------------------------------
    def print_error_message(msg)
        print "<< ERROR: #{msg.to_s} !!\n"
    end
    
    ##---------------------------------------------------------------
    ## Constants to be used on the program
    ##---------------------------------------------------------------
    SPACE_SEPARATOR = "******************************"
    SHOW_HEADER = 1
    
    #################################################
    ## RUN POINT FOR THE APPLICATION
    #################################################
    main();