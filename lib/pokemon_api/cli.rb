class Cli 

    def run
        puts "Gotta' Catch Em' All!"

        puts "Pack your pokeballs, we're going hunting today..."

        API.get_pokemon
        puts "A wild animal with magic powers randomly appeared, how unexpected."
        print_main_menu
    end 

    def print_main_menu
        puts ""
        puts "Press 1 to list out all the Pokemon that appeared."
        puts "Press 2 to get all the abilities of said Pokemon."
        puts "Type 'exit' to exit program"
        main_menu
    end 

    def main_menu
        user_input = gets.strip

        if user_input == "1"
            print_pokemon
            print_main_menu
        elsif user_input == "2"
            print_poke_info_menu
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

    def print_poke_info_menu
        puts ""
        puts "---------"
        Pokemon.all.each.with_index(1) do |poke, index|
            puts ""
            puts "#{poke.name.capitalize} has these abilities: #{poke.abilities.join(", ")}"
        end 
    end 

    def goodbye
        puts "In Russia, Pikachu did not choose you."
    end  

    def invalid_input
        puts "Invalid Command, please try again!"
    end 
end 