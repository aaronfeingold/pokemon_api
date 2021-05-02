class Cli 

    def run
        puts ""
        puts "                  _____________________"
        puts "                  Gotta' Catch Em' All!"
        puts "                  ---------------------"
        puts ""

        puts "Before heading out on our adventure, we'll need download our PokeDex"

        api = API.new

        puts ""
        puts "Oh? A wild pack of animals with magical powers randomly appeared. How unexpected!"
        puts ""
        puts "Wouldn't it be great if we knew something more about them?"

        main_menu(api)
    end 

    def main_menu(api)
        user_input = ""
        while user_input != "exit"
            puts ""
            puts "               _________"
            puts "               Main Menu"
            puts "               ---------"
            puts "To open the poke dex, type '1' then enter."
            puts "To quit the program 'q' "
        
            user_input = gets.strip

            case user_input 
            when "1"
                open_poke_dex(api)
            when "q"
                goodbye 
            when "q"
                exit
            else
                invalid_input
            end
        end     
    end 

    def open_poke_dex(api)
        api.get_data
        count = api.count
        puts "------------------------------"
        puts "There are a total of: #{count} pokemon here."
        puts "------------------------------"
        
        user_input = ""
        while user_input != "exit"
            puts "Create List"
            puts "--of all Pokemon, enter '1' "
            puts "Otherwise, type '86' to return to the main menu"

            user_input = gets.strip

            case user_input 
            when "1"
                list_pokemon(api)
            when "86"
                main_menu(api)
            when "exit"
                exit 
            else
                invalid_input
            end
        end
    end 

    def list_pokemon(api, poke_dex)
        puts "One moment please..."
        puts "_______________"
        puts "listing..."
        Poke.list
        puts "Would you like more details for a certain pokemon? [y/N]"
        
        user_input = ""
        while user_input != "exit"
            user_input = gets.strip

            case user_input 
            when "y"
                get_poke_details_by_name(poke_dex)
            when "N"
                main_menu(api)
            when "exit"
                exit 
            else
                invalid_input
            end
        end
    end

    def get_poke_details_by_name(api, poke_dex)
        user_input = ""
        puts "One Moment, loading more info..."
        puts "_______________"
        puts "Please enter the name of the pokemon you'd like details for."
        user_input = gets.strip
        get_poke_by_name(user_input)
        
        puts "please enter the name of the pokemon who's details you'd like to view"
        name = gets.strip
        poke = Poke.find_poke_by_name(name)
        if poke
            print "Success, we have a match"
        else
            print "Error, try again"
            get_poke_by_name
        end

        print "type '1' to see all of details for this pokemon"
        user_input = ""
        while user_input != "exit"
            user_input = gets.strip

        case user_input 
            when "1"
                get_poke_details(poke)
            when "86"
                main_menu
            when "exit"
                exit 
            else
                invalid_input
            end
        end
    end

    def get_poke_details(poke)
        puts "One moment, loading details..."
        detailed_poke = poke.get_details
        puts "...details loaded"
        puts `#{detailed_poke}`
    end

    def list_pokemon_by_alpha_asc
        puts""
        puts "--------------------"
        Poke.sort_asc
        puts "-----------------------------------"
    end 

     

    # def menu_pokemon_attributes
    #     user_input = ""
    #     while user_input != "exit"
    #         puts ""
    #         puts "            _______________"
    #         puts "            Attributes Menu"
    #         puts "            ---------------"
    #         puts "To learn an individual pokemon's" 
    #         puts "--type(s), hit '1' then enter."
    #         puts "--ability(-ies), hit '2' then enter."
    #         puts "--move(s), hit '3' then enter."
    #         puts "To retrun to the main menu, type '123' then enter."
        
    #         user_input = gets.strip

    #         case user_input 
    #         when "1"
    #             show_pokemon("types")
    #         when "2"
    #             show_pokemon("abilities")
    #         when "3"
    #             show_pokemon("moves")
    #         when "123"
    #             main_menu
    #         when "99"
    #             goodbye 
    #         else
    #             invalid_input
    #         end
    #     end     
    # end 
    
    # def show_pokemon(arg)
    #     puts ""
    #     puts "______"
    #     puts "Please allow us a moment to process your request..."
    #     puts "------"

    #     PokeDex.get_pokemon_details

    #     if arg == "types"
    #         atr = arg
    #         prompt_1(atr)
    #         input = gets.strip
    #             if input.to_i.between?(1, Pokemon.all.length)
    #                 pokemon = Pokemon.all[input.to_i-1]
    #                 puts ""
    #                 puts "A #{pokemon.name.capitalize} belongs to this/these type(s): #{pokemon.types.join(", ").reverse.sub(',', 'dna ,').reverse}."
    #              end 
    #                 puts "------------------------------"

    #             menu_pokemon_attributes
    #     elsif arg == "abilities"
    #             atr = arg   
    #             prompt_1(atr)
    #             input = gets.strip
    #                 if input.to_i.between?(1, Pokemon.all.length)
    #                     pokemon = Pokemon.all[input.to_i-1]
    #                     puts ""
    #                     puts "The abilities of #{pokemon.name.capitalize} are: #{pokemon.abilities.join(", ").reverse.sub(',', 'dna ,').reverse}."
    #                 end 
    #              puts "------------------------------"

    #              menu_pokemon_attributes
    #     elsif arg == "moves"
    #             atr = arg     
    #             prompt_1(atr)
    #             input = gets.strip
    #                 if input.to_i.between?(1, Pokemon.all.length)
    #                     pokemon = Pokemon.all[input.to_i-1]
    #                     puts ""
    #                     puts "Here is a list off all the moves that #{pokemon.name.capitalize} can do:"
    #                     puts "      #{pokemon.moves.join(", ").reverse.sub(',', 'dna ,').reverse.capitalize}."
    #                 end 
    #              puts "------------------------------" 

    #              menu_pokemon_attributes
    #     end
    # end 

    # private 

    # def prompt_1(atr)
    #     puts ""
    #     puts "Please enter the Pokedex number of the Pokemon who's #{atr.upcase} you would like to see (1-20)"
    # end 

    # public 

    # def menu_get_all_info_by_name
    #     puts ""
    #     puts "______"
    #     puts "Please allow us a moment to process your request..."
    #     puts "------"

    #     PokeDex.get_pokemon_details

    #     puts ""
    #     puts "______"
    #     puts "Please enter the Pokemon's NAME from the given list who's available information you'd like to see."
    #     puts "Otherwise, please enter '1' to return to the main menu."
    #     puts "------"
    #     user_input = gets.strip.downcase
    #     if pokemon = Pokemon.find_pokemon_by_name(user_input)
    #         puts ""
    #         puts "Here is all the information we have on #{pokemon.name.capitalize}:"
    #         puts ""
    #         puts "1.) Type(s): #{pokemon.types.join(", ")}"
    #         puts "-----"
    #         puts "2.) Ability(-ies): #{pokemon.abilities.join(", ")}"
    #         puts "-----"
    #         puts "3.) Moves: #{pokemon.moves.join(", ")}"
    #         puts "-----"
    #         menu_get_all_info_by_name
    #     elsif user_input == "1"
    #         main_menu 
    #     else
    #         puts "That pokemon does not exist (in our list, at least)..."
    #         puts "Please try again!"
    #         menu_get_all_info_by_name
    #     end 
    # end 

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



