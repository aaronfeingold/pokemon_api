class API
    # responsible for initial API call
    # source is free and public.
    BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=5"
    @@count = nil

    # returns a new PokeDex object
    def get_data
        # make the API call
        response = RestClient.get(BASE_URL)
        # parse the data
        data = JSON.parse(response)
        # the value of results points to an array
        poke_dex_data = data["results"]
        # work with a short one first
        @@count = poke_dex_data.length
        # create a new PokeDexObj
        poke_dex_obj = PokeDex.new(poke_dex=poke_dex_data)

        return poke_dex_obj
    end 

    # method to read class variable
    def count
        @@count
    end 

end