class API
    # BIGGEST JOB HERE: poke_dex_opj can be accessed
    attr_accessor :poke_dex_obj
    # responsible for initial call to pokemon API
    # confusingly, this is an API to connect to the external API
    # does the heavy work for our app at opening of getting it loaded with necessary data to begin.
    # source below is free and public
    BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=5"
    # you can change your limit to 150...but beware of load time constraints
    # api pagination gums up the works
    # this can help you confirm the limit
    @@count = nil
    # at initialization, goes to work of getting data
    def initialize
        @poke_dex_obj = self.get_data
    end

    # returns a new PokeDex object
    def get_data
        # make the API call
        response = RestClient.get(BASE_URL)
        # parse the data
        data = JSON.parse(response)
        # the value of results points to an array
        poke_dex_data = data["results"]
        # work with a short one first
        # should be matching out limit
        @@count = poke_dex_data.length
        # create a new PokeDexObj
        poke_dex_obj = PokeDex.new(poke_dex=poke_dex_data)
        # some of this work seems like it could be done with fewer classes
        # really the poke_dex_object is a way to separate concerns
        # ie this does the work of making new objects.
        # while the poke class does the wokd of breaking down each of those objects
        # more service class (hashit) contributes to the work of the poke class
        return poke_dex_obj
    end 

    # method to read class variable
    def count
        @@count
    end 

end