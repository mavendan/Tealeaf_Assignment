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
        result = 0
      #Start looping
        begin
          operator = gets.chomp
          if operator != 'q'
              case operator.downcase
              when "+"
                    result = add_operation(result)
               when "-"
                    result= sub_operation(result)
                when "*"
                    result= mult_operation(result)
                when "/"
                   result= div_operation(result)
                 when "r"
                    print_message("Result: #{result.to_s}")
              else
                print_message("Invalid operation. Specify operation to perform: +, -, * or /. Try again")
              end ##END OF CASE
            #menu_options();
          end ##END OF IF OPERATOR != Q
      end while operator != 'q'  ##END OF BEGIN WHILE
      print_message "Ended calculator..."
    end
    ##---------------------------------------------------------------
    ## Method: add_operation
    ## Description:  perform adding operator
    ##---------------------------------------------------------------
    def add_operation(result)        
        begin
            number = gets.chomp
            result += number.to_i            
        rescue StandardError => e
          print_error_message "Invalid number. Ending add operation.\n#{e.message}"
        end        
        return result
    end
     ##---------------------------------------------------------------
    ## Method: sub_operation
    ## Description:  perform substraction operation
    ##---------------------------------------------------------------
    def sub_operation(result)
        begin
            number = gets.chomp
            result -= number.to_i            
        rescue StandardError => e
          print_error_message "Invalid number. Ending substract operation.\n#{e.message}"
        end        
        return result
    end 
    ##---------------------------------------------------------------
    ## Method: mult_operation
    ## Description:  perform multiplication operation
    ##---------------------------------------------------------------
    def mult_operation(result)
        begin
            number = gets.chomp
            result *= number.to_i            
        rescue StandardError => e
          print_error_message "Invalid number. Ending multiply operation.\n#{e.message}"
        end        
        return result
    end 
   
    ##---------------------------------------------------------------
    ## Method: div_operation
    ## Description:  perform division operation
    ##---------------------------------------------------------------
    def div_operation(result) 
        begin
            number = gets.chomp
            result /= number.to_f            
        rescue StandardError => e
          print_error_message "Invalid number. Ending divide operation.\n#{e.message}"
        end        
        return result
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
      print_message 'Select operation to perform and then press ENTER'
      print_message '+. Add'
      print_message '-. Substract'
      print_message '*. Multiply'
      print_message '/. Divide'
      print_message "Press 'r' to display the result"
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