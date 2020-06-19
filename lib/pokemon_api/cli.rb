class Cli 

    def run
        puts "Gotta' Catch Em' All!"

    #     puts "                                  ,'\
    #     _.----.        ____         ,'  _\   ___    ___     ____
    # _,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.
    # \      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |
    #  \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |
    #    \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
    #     \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |
    #      \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |
    #       \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   |
    #        \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
    #         \_.-'       |__|    `-._ |              '-.|     '-.| |   |
    #                                 `'                            '-._|"

        puts "Pack your pokeballs, we're going hunting today..."

        API.get_pokemon
        puts "A wild animal with magic powers randomly appeared, how unexpected."
        main_menu
    end 

    def main_menu
        user_input = ""
        while user_input != "exit"
            puts ""
            puts "To list all the Pokemon, enter 1."
            puts "To learn the abilities of an indiviual pokemon, enter 2."
            puts "To quit the program, enter 'exit'.'"
        
            user_input = gets.strip

            case user_input 
            when "1"
                list_pokemon
            when "2"
                list_pokemon_abilities
            when "exit"
                goodbye 
            when ""
                invalid_input
            end
        end     
    end 

    def list_pokemon
        puts""
        puts "--------------------"
        Pokemon.all.each.with_index(1) do |pokemon, index| 
            puts ""
            puts "Pokemon  #{index}: #{pokemon.name.capitalize}"
        end 
    end 

    def list_pokemon_abilities 
        puts ""
        puts "To learn a Pokemon's abilities, please enter the pokemon's corresponding number"
        
        input = gets.strip
        if input.to_i.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input.to_i-1]
            puts ""
            puts "The abilities of #{pokemon.name.capitalize} are: #{pokemon.abilities.join(", ")}"
         end 
    end 

    

    def goodbye
        puts "In Russia, Pikachu did not choose you."
    end  

    def invalid_input
        puts "Invalid Command, please try again!"
    end 
end 