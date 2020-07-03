class Cli 

    def run
        puts ""
        puts "_____________________"
        puts "Gotta' Catch Em' All!"
        puts "---------------------"
        puts ""

        # puts "                                    ,'\
        #             _.----.        ____         ,'  _\   ___    ___     ____
        #         _,-'       `.     |    |  /`.   \,-'    |  /\  /   |   |    /\  |`.
        #         /\      __  /\    '-.  | /   `.  ___    |   /\/    |   '-.   /\ |  |
        #          /\.   /\/\   |  __  | |/    ,',' _  `.  |          | __  |   /\|  |
        #            /\   /\/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
        #             /\     ,-'/  /  /\    ,'   | \/ / ,`.|         /  /  /\  |     |
        #              /\   /\ |   \_/  |   `-. /\    `'  /|  |    ||   \_/  | |\    |
        #               /\   /\/\      /       `-.`.___,-' |  |\  /|/\      /  | |   |
        #                /\   /\ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
        #                 /\_.-'       |__|    `-._ |              '-.|     '-.| |   |
        #                                          `'                            '-._|
                                                 
        #                                          "

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
            puts "               Main Menu"
            puts "               ---------"
            puts "To list all the Pokemon, hit '1' then enter."
            puts "To learn the abilities of an indiviual pokemon, hit '2' then enter."
            # puts "To sort pokemon by type, enter 3"
            puts "To quit the program, type 'exit' then enter.'"
        
            user_input = gets.strip

            case user_input 
            when "1"
                list_pokemon
            when "2"
                list_pokemon_abilities
            # when "3"
            #     sort_pokemon_types
            when "exit"
                goodbye 
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
            puts "Pokemon Pokedex Number #{index}: #{pokemon.name.capitalize}"
        end 
    end 

    def list_pokemon_abilities 
        puts ""
        puts "Please enter the Pokedex number of the Pokemon who's abilities you would like to learn (1-20)"
        
        input = gets.strip
        if input.to_i.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input.to_i-1]
            puts ""
            puts "The abilities of #{pokemon.name.capitalize} are: #{pokemon.abilities.join(", ")}"
         end 
    end 

    # def sort_pokemon_by_type
    #     puts""
    #     puts "Please enter a type of Pokemon to learn"
    #     input = gets.strip
    #     type = Pokemon.find_all_by_type[]
    # end

    def goodbye
        puts ""
        puts "If there was gif here, it would be Pikachu waving goodbye with a single teardrop slidding down..."
    end  

    def invalid_input
        puts "Invalid Command, please try again!"
    end 
end 