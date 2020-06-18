class Pokemon
    attr_accessor :name, :url, :abilities, :moves
    
    @@all = [] 

    def initialize(name:, url:)
        self.name = name
        self.url = url 
        self.save 
    end 

    def save
        @@all << self 
    end 

    def self.all
        @@all
    end 
end 


