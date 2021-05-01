require_relative 'environment.rb'

def get_data(event)
  # create a new api object
  api_obj = API.new
  # create a new PokeDex object 
  pd_obj = api_obj.get_data
  # create many new Poke objects
  pokes = pd_obj.create_pokes
  # get the first poke_obj
  poke_obj = pokes[0]

  Poke.get_more_from_url(poke_obj)
  binding.pry
end

# example: 
event = "amazon_cloud_watch"

dict = get_data(event)

# # keys = results.first.keys
# # sc = PokeSubClass.new
# # sc.create_attributes(keys)
# # p sc.attr_accessors

# Poke.all.first.details.keys
  # all_poke_data = Array.new

  # pd.poke_dex.each do |poke|
  #   poke_data = JSON.parse(RestClient.get(poke["url"]))
  #   all_poke_data << poke_data
  # end 

  # return all_poke_data



#   def get_pokemon_details
#     Pokemon.all.each do |pokemon|
#         info = RestClient.get(pokemon.url)
#         data = JSON.parse(info)
#         binding.pry
#         pokemon.abilities = data["abilities"].map { |hash| hash["ability"]["name"] } 
#         pokemon.moves = data["moves"].map { |hash| hash["move"]["name"] }
#         pokemon.types = data["types"].map { |hash| hash["type"]["name"] }
#     end
# end 




    # EXAMPLE of array of symbols for attrs.

    # array = [:abilities,
    # :base_experience,
    # :forms,
    # :game_indices,
    # :height,
    # :held_items]



# def get_keys(data)
#   data = get_data
#   keys = data.first.keys
#   return keys
# end

# def create_attributes(data)
#   # programmatically create attr_accessors for Pokemon class
#   # extract the attributes into an array, assign them to a constant
#   # then splat them in to attr_accessor
  
#   # for example: 
#   attributes = keys.each do |key|
#     # for each key, create a new class Model attribute
#     PokeSubClass.create_attribute_by_key(key)
#   end
#   binding.pry
# end