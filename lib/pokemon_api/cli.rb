class Cli 

    def run
        puts "Gotta' Catch Em' All!"

        puts "Pack you pokeballs, we're going hunting today..."

        API.get_pokemon
        puts "A wild animal with magic powers randomly appeared, how unexpected."
        print_main_menu
    end 

    def print_main_menu
        puts "Press 1 to list out Pokemon"
        puts "Type 'exit' to exit program"
        main_menu
    end 

    def main_menu
        user_input = gets.strip

        if user_input == "1"
            print_pokemon
            print_main_menu
        elsif user_input == "exit"
            goodbye
            exit
        else
            invalid_input
            print_main_menu
        end    
    end 

    def print_pokemon
        puts""
        puts "----------"
        Pokemon.all.each.with_index(1) do |poke, index| 
            puts ""
            puts "Pokemon  #{index}: #{poke.name.capitalize}"
        end 
    end 

    def goodbye
        puts "In Russia, Pickachu did not choose you."
    end  

    def invalid_input
        puts "Invalid Command, please try again!"
    end 
end 