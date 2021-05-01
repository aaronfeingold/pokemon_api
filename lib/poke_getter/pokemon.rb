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

    def self.get_all_details
        @@all.each do |pk|
            pk.abilities = pk.more["abilities"]
            pk.base_experience = pk.more["base_experience"]
            pk.forms = pk.more["forms"]
            pk.game_indices = pk.more["game_indices"]
            pk.height = pk.more["height"]
            pk.held_items = pk.more["held_items"]
            pk.id = pk.more["id"]
            pk.is_default = pk.more["is_default"]
            pk.location_area_encounters = pk.more["location_area_encounters"]
            pk.moves = pk.more["moves"]
            pk.name = pk.more["name"]
            pk.order = pk.more["order"]
            pk.past_types = pk.more["past_types"]
            pk.species = pk.more["species"]
            pk.sprites = pk.more["sprites"]
            pk.stats = pk.more["stats"]
            pk.types = pk.more["types"]
            pk.weight = pk.more["weight"]
        end
    end
    
end
