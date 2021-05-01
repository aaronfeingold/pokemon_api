class API
    BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=5"
    attr_accessor :pd
    @@count = nil

    def get_data
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)
        poke_dex_data = data["results"]
        @@count = poke_dex_data.length
        poke_dex = PokeDex.new(poke_dex=poke_dex_data)
        return poke_dex
    end 

    def count
        @@count
    end 

end