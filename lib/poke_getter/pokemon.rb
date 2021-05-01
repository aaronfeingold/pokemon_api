class PokeDex
    attr_accessor :poke_dex

    def initialize(poke_dex=poke_dex)
        self.poke_dex = poke_dex
    end

    def create_poke_from_dex
        self.poke_dex.each {|poke| Poke.new(poke=poke)}
    end
end

class Poke
    attr_accessor :name, :url, :more, :abilities, :base_experience, :forms, :game_indices, :height, :held_items, :id, :is_default, :location_area_encounters, :moves, :name, :order, :past_types, :species, :sprites, :stats, :types, :weight

    @@all = []
    @@counter = 0

    def initialize(poke=poke)
        self.name = poke["name"]
        self.url = poke["url"]
        self.save
        @@counter += 1
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.count
        @@counter
    end

    def self.get_more_from_url
        @@all.each do |pk|
            json = RestClient.get(pk.url)
            data = JSON.parse(json)
            pk.more = data
        end
    end

    def self.get_all_details(poke)
        # THIS NEEDS TO BE PROGRAMMATIC. TOO MANUAL
        a = [poke.game_indices, poke.height, poke.held_items, poke.id, poke.is_default, poke.location_area_encounters, poke.moves, poke.name, poke.order, poke.past_types, poke.species, poke.sprites, poke.stats, poke.types, poke.weight ]

        binding.pry
        # poke.more["abilities"] =
        # poke.more["base_experience"] = 
        # poke.more["forms"] = 
        # poke.more["game_indices"] = 
        # poke.more["height"] = 
        # poke.more["held_items"] =
        # poke.more["id"] =
        # poke.more["is_default"] =
        # poke.more["location_area_encounters"] =
        # poke.more["moves"] =
        # poke.more["name"] =
        # poke.more["order"] =
        # poke.more["past_types"] =
        # poke.more["species"] =
        # poke.more["sprites"] =
        # poke.more["stats"] =
        # poke.more["types"] =
        # poke.more["weight"] =
        # return poke


    end

    def self.find_poke_by_name(name)
         @@all.find{|poke| poke.name.downcase === name.downcase }
    end
    
end
