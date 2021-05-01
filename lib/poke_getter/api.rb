class API
    BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=5"
    @@count = nil

    def get_data
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)
        poke_dex_data = data["results"]
        @@count = poke_dex_data.length
        return poke_dex_data
    end 

    def count
        @@count
    end 

end