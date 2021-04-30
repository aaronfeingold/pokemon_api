class PokeDex
    # to-do: increase or decrease limit of query
    BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=5"

    def self.create_poke_dex
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)

        data["results"].each do |pokemon_data|
            name = pokemon_data["name"]
            url = pokemon_data["url"]
            Pokemon.new(name: name, url: url)
        end
    end 

    def self.get_pokemon_details
        Pokemon.all.each do |pokemon|
            info = RestClient.get(pokemon.url)
            data = JSON.parse(info)
            binding.pry
            pokemon.abilities = data["abilities"].map { |hash| hash["ability"]["name"] } 
            pokemon.moves = data["moves"].map { |hash| hash["move"]["name"] }
            pokemon.types = data["types"].map { |hash| hash["type"]["name"] }
        end
    end 
end 