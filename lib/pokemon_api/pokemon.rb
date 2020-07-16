require 'pry'

class Pokemon
    attr_accessor :name, :url, :abilities, :moves, :types
    
    @@all = [] 
    @@counter = 0

    def initialize(name:, url:)
        self.name = name
        self.url = url
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

   def self.find_pokemon_by_name(name)
        self.all.find do |pokemon|
             pokemon.name == name
        end
    end

end 


# bulba = Pokemon.new(:name => "Bulbasaur", :url => "bulbasau.com")
# char = Pokemon.new(:name => "Charmander", :url => "charmander.com")
# squirt = Pokemon.new(:name => "Squirtle", :url => "squirtle.com")



# binding.pry