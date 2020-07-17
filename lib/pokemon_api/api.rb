class API
    BASE_URL = "https://pokeapi.co/api/v2"

    def self.get_first_page_of_pokemon
        response = RestClient.get(BASE_URL + "/pokemon")
        data = JSON.parse(response)
        data["results"].each do |pokemon_data|
            name = pokemon_data["name"]
            url = pokemon_data["url"]
        Pokemon.new(
            name: name,
            url: url
        )
        end
    end 

    def self.get_more_pokemon
        
    end 

    def self.get_pokemon_details
        Pokemon.all.each do |pokemon|
            info = RestClient.get(pokemon.url)
            data = JSON.parse(info)
            pokemon.abilities = data["abilities"].map { |hash| hash["ability"]["name"] } 
            pokemon.moves = data["moves"].map { |hash| hash["move"]["name"] }
            pokemon.types = data["types"].map { |hash| hash["type"]["name"] }
        end
    end 
end 

 

