class Cli 

    def run
        puts ""
        puts "                  _____________________"
        puts "                  Gotta' Catch Em' All!"
        puts "                  ---------------------"
        puts ""

        puts "Before heading out on our adventure, we'll need to pack up our pokeballs."

        API.get_first_page_of_pokemon

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
            puts "To learn an individual pokemon's attibutes, hit '3' then enter."
            puts "To search for all information available about a particular Pokmeon by that Pokemon's name, hit '4' then enter."
            puts "To quit the program, type '99' then enter."
        
            user_input = gets.strip

            case user_input 
            when "1"
                pokemon_count_menu
            when "2"
                list_pokemon
            when "3"
                menu_pokemon_attributes
            when "4"
                menu_get_all_info_by_name
            when "99"
                goodbye 
            when "exit"
                exit
            else
                invalid_input
            end
        end     
    end 

    def pokemon_count_menu
        number_of_pokemon_parsed = Pokemon.count
        user_input = ""
        while user_input != "exit"
            puts""
            puts "------------------------------"
            puts "There are a total of: #{number_of_pokemon_parsed} here."
            puts "------------------------------"
            puts "To list"
            puts "--all the Pokemon here, hit '1' then enter"
            puts "--all the Pokemon here by alphabetical order, hit '2' then enter"
            puts "Otherwise, hit '3' to return to the main menu"

            user_input = gets.strip

            case user_input 
            when "1"
                list_pokemon
            when "2"
                list_pokemon_by_alpha_asc
            when "3"
                main_menu
            when "exit"
                exit 
            else
                invalid_input
            end
        end
    end 

    def list_pokemon
        puts""
        puts "--------------------"
        Pokemon.all.each.with_index(1) do |pokemon, index| 
            puts ""
            puts "#{index}. #{pokemon.name.capitalize}"
        end
        puts "-----------------------------------"
    end

    def list_pokemon_by_alpha_asc
        puts""
        puts "--------------------"
        Pokemon.all.sort_by { |pokemon| pokemon.name }.each.with_index(1) do |pokemon, index| 
            puts ""
            puts "#{pokemon.name.capitalize}"
        end
        puts "-----------------------------------"
    end 

     

    def menu_pokemon_attributes
        user_input = ""
        while user_input != "exit"
            puts ""
            puts "            _______________"
            puts "            Attributes Menu"
            puts "            ---------------"
            puts "To learn an individual pokemon's" 
            puts "--type(s), hit '1' then enter."
            puts "--ability(-ies), hit '2' then enter."
            puts "--move(s), hit '3' then enter."
            puts "To retrun to the main menu, type '123' then enter."
        
            user_input = gets.strip

            case user_input 
            when "1"
                show_pokemon("types")
            when "2"
                show_pokemon("abilities")
            when "3"
                show_pokemon("moves")
            when "123"
                main_menu
            when "99"
                goodbye 
            else
                invalid_input
            end
        end     
    end 
    
    def show_pokemon(arg)
        puts ""
        puts "______"
        puts "Please allow us a moment to process your request..."
        puts "------"

        API.get_pokemon_details

        if arg == "types"
            atr = arg
            prompt_1(atr)
            input = gets.strip
                if input.to_i.between?(1, Pokemon.all.length)
                    pokemon = Pokemon.all[input.to_i-1]
                    puts ""
                    puts "A #{pokemon.name.capitalize} belongs to this/these type(s): #{pokemon.types.join(", ").reverse.sub(',', 'dna ,').reverse}."
                 end 
                    puts "------------------------------"

                menu_pokemon_attributes
        elsif arg == "abilities"
                atr = arg   
                prompt_1(atr)
                input = gets.strip
                    if input.to_i.between?(1, Pokemon.all.length)
                        pokemon = Pokemon.all[input.to_i-1]
                        puts ""
                        puts "The abilities of #{pokemon.name.capitalize} are: #{pokemon.abilities.join(", ").reverse.sub(',', 'dna ,').reverse}."
                    end 
                 puts "------------------------------"

                 menu_pokemon_attributes
        elsif arg == "moves"
                atr = arg     
                prompt_1(atr)
                input = gets.strip
                    if input.to_i.between?(1, Pokemon.all.length)
                        pokemon = Pokemon.all[input.to_i-1]
                        puts ""
                        puts "Here is a list off all the moves that #{pokemon.name.capitalize} can do:"
                        puts "      #{pokemon.moves.join(", ").reverse.sub(',', 'dna ,').reverse.capitalize}."
                    end 
                 puts "------------------------------" 

                 menu_pokemon_attributes
        end
    end 

    private 

    def prompt_1(atr)
        puts ""
        puts "Please enter the Pokedex number of the Pokemon who's #{atr.upcase} you would like to see (1-20)"
    end 

    public 

    def menu_get_all_info_by_name
        puts ""
        puts "______"
        puts "Please allow us a moment to process your request..."
        puts "------"

        API.get_pokemon_details

        puts ""
        puts "______"
        puts "Please enter the Pokemon's NAME from the given list who's available information you'd like to see."
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
            menu_get_all_info_by_name
        elsif user_input == "1"
            main_menu 
        else
            puts "That pokemon does not exist (in our list, at least)..."
            puts "Please try again!"
            menu_get_all_info_by_name
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



