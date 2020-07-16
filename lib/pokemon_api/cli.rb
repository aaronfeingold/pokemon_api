class Cli 

    def run
        puts ""
        puts "_____________________"
        puts "Gotta' Catch Em' All!"
        puts "---------------------"
        puts ""

        puts "Before heading out on our adventure, we'll need to pack up our pokeballs."

        API.get_pokemon

        puts ""
        puts "Oh? A wild pack of animals with magical powers randomly appeared. How unexpected!"
        puts ""
        puts "Wouldn't it be great if we knew something more about them?"
        main_menu
    end 

    def main_menu
        user_input = ""
        while user_input != "exit"
            puts ""
            puts "               _________"
            puts "               Main Menu"
            puts "               ---------"
            puts "To find out how many Pokemon there are, hit '1' then enter."
            puts "To list all the Pokemon, hit '2' then enter."
            puts "To learn an individual pokemon's ability(-ies), hit '3' then enter."
            puts "To learn an individual pokemon's type(s), hit '4' then enter."
            puts "To learn an individual pokemon's move(s), hit '5' then enter."
            puts "To search for all information available about a particular Pokmeon by that Pokemon's name, hit '6' then enter."
            puts "To quit the program, type '99' then enter."
        
            user_input = gets.strip

            case user_input 
            when "1"
                pokemon_count
            when "2"
                list_pokemon
            when "3"
                show_pokemon_abilities
            when "4"
                show_pokemon_types
            when "5"
                show_pokemon_moves
            when "6"
                get_all_info_by_name
            when "99"
                goodbye 
            else
                invalid_input
            end
        end     
    end 

    def pokemon_count
        puts""
        puts "------------------------------"
        number_of_pokemon_parsed = Pokemon.count
        puts "There are a total of: #{number_of_pokemon_parsed} here."
        puts "------------------------------"
    end 

    def list_pokemon
        puts""
        puts "--------------------"
        Pokemon.all.each.with_index(1) do |pokemon, index| 
            puts ""
            puts "Pokemon Pokedex Number #{index}: #{pokemon.name.capitalize}"
        end 
        puts "-----------------------------------"
    end 

    def show_pokemon_abilities 
        puts ""
        puts "Please enter the Pokedex number of the Pokemon who's ABILITIES you would like to see (1-20)"
        
        input = gets.strip
        if input.to_i.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input.to_i-1]
            puts ""
            puts "The abilities of #{pokemon.name.capitalize} are: #{pokemon.abilities.join(", ")}"
         end 
         puts "------------------------------"
    end 

    def show_pokemon_types 
        puts ""
        puts "Please enter the Pokedex number of the Pokemon who's TYPES you would like to see (1-20)"
        
        input = gets.strip
        if input.to_i.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input.to_i-1]
            puts ""
            puts "A #{pokemon.name.capitalize} belongs to this/these type(s): #{pokemon.types.join(", ")}"
         end 
         puts "------------------------------"
    end 

    def show_pokemon_moves 
        puts ""
        puts "Please enter the Pokedex number of the Pokemon who's MOVES you would like to see (1-20)"
        
        input = gets.strip
        if input.to_i.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input.to_i-1]
            puts ""
            puts "Here is a list off all the moves that #{pokemon.name.capitalize} can do:"
            puts "#{pokemon.moves.join(", ")}"
         end 
         puts "------------------------------"
    end 

    def get_all_info_by_name
        puts ""
        puts "______"
        puts "Please enter the Pokemon's NAME from the given list who's detailed information you'd like to see (1-20)"
        puts "Otherwise, please enter '1' to return to the main menu."
        puts "------"
        user_input = gets.strip.downcase
        if pokemon = Pokemon.find_pokemon_by_name(user_input)
            puts ""
            puts "Here is all the information we have on #{pokemon.name.capitalize}:"
            puts ""
            puts "1.) Type(s): #{pokemon.types.join(", ")}"
            puts "-----"
            puts "2.) Ability(-ies): #{pokemon.abilities.join(", ")}"
            puts "-----"
            puts "3.) Moves: #{pokemon.moves.join(", ")}"
            puts "-----"
            get_all_info_by_name
        elsif user_input == "1"
            main_menu 
        else
            puts "That pokemon does not exist (in our list, at least)..."
            puts "Please try again!"
            get_all_info_by_name
        end 
    end 

    def goodbye
        puts ""
        puts "Thank you for playing!"
        exit
    end  

    def invalid_input
        puts "------------------------------"
        puts "Invalid Command, please try again!"
    end 
end 


