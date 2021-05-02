require_relative 'environment.rb'

def get_data(event)
  # create a new api object
  api_obj = API.new
  # create a new PokeDex object 
  # create many new Poke objects
  pd_obj = api_obj.poke_dex_obj
  # get the first poke_obj
  poke_obj = pd_obj.poke_objs[0]
  poke_obj.get_details
  poke_obj.create_attributes_list
  binding.pry 
end

# example: 
event = "amazon_cloud_watch"

dict = get_data(event)

# a = poke_obj.attributes_list.uniq
# p a
#=> ["abilities", "base experience", "forms", "game indices", "height", "held items", "id", "is default", "location area encounters", "moves", "name", "order", "past types", "species", "url", "sprites", "back default", "back female", "back shiny", "back shiny female", "front default", "front female", "front shiny", "front shiny female", "other", "dream world", "official-artwork", "versions", "generation-i", "red-blue", "back gray", "front gray", "yellow", "generation-ii", "crystal", "gold", "silver", "generation-iii", "emerald", "firered-leafgreen", "ruby-sapphire", "generation-iv", "diamond-pearl", "heartgold-soulsilver", "platinum", "generation-v", "black-white", "animated", "generation-vi", "omegaruby-alphasapphire", "x-y", "generation-vii", "icons", "ultra-sun-ultra-moon", "generation-viii", "stats", "types", "weight"]
# p a.length
#=> 58 