require_relative 'environment.rb'

def get_data
  pokemons = PokeDex.create_poke_dex

  all_poke_data = Array.new

  pokemons.each do |poke|
    poke = RestClient.get(poke["url"])
    poke_data = JSON.parse(poke)
    all_poke_data << poke_data
  end 

  return all_poke_data

end 

def extract_data

  data = get_data
  
  keys = data.first.keys

  data.each do |item|
    # for each key, create a new class Model attribute
  end

end


extract_data





