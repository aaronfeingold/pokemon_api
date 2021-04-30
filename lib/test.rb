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

data = get_data
print(data.first)









