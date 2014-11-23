    ##---------------------------------------------------------------
    ## Calculator.rb
    ## First assignment on the tealeaf Ruby course
    ## This class perform the following maths operations:
    ## add, substract, multiply and divide
    ##---------------------------------------------------------------
    
    def  main
            main_menu(SHOW_HEADER)
    end
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
          
          if(result == 0)
                number = gets.chomp
                result = number.to_f
          end
          
          if operator != 'q'              
              if  operator.downcase == "r"
                    print_message("Result: #{result.to_s}")
              else
                   result= math_operation(result, operator)
              end ##END OF CASE
            #menu_options();
          end ##END OF IF OPERATOR != Q
      end while operator != 'q'  ##END OF BEGIN WHILE
      print_message "Ended calculator..."
    end
    ##---------------------------------------------------------------
    def math_operation (result, operator)
           number = gets.chomp
             
              case operator.downcase
              when "+"
                    result += number.to_f
               when "-"
                    result -= number.to_f
                when "*"
                    result *= number.to_f
                when "/"
                    if number == 0 || number == 0.0
                        print_message "Not allow division by zero"                
                    else            
                        result /= number.to_f      
                    end ## end of number == 0 || number == 0.0       
                else
                    print_message("Invalid operation. Specify operation to perform: +, -, * or /. Try again")
             end ##end of case
             print_message "= #{result.to_s}"
             return result
     end ##end of math_operation
     ##---------------------------------------------------------------
    def show_header()
        print_message (SPACE_SEPARATOR)
        print_message 'Welcome to Ruby Calculator'
        print_message (SPACE_SEPARATOR) 
    end
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
    def print_message(msg)
        print ">> #{msg.to_s} \n"
    end
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
    main