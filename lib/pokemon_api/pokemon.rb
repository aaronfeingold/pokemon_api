class Pokemon
    attr_accessor :name
    
    @@all = [] 

    def initialize(name:)
        self.name = name
        self.save 
    end 

    def save
        @@all << self 
    end 

    def self.all
        @@all
    end 
end 


