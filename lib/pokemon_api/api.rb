class API
    BASE_URL = "https://pokeapi.co/api/v2"

    def self.get_pokemon
        response = RestClient.get(BASE_URL + "/pokemon")
        data = JSON.parse(response)
        data["results"].each do |pokemon_data|
            name = pokemon_data["name"]
        Pokemon.new(
            name: name
        )
        end 
    end 

   
end 

 

