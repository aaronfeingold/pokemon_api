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
    
    def find_by_name(name)
        self.all.find {|obj| obj.name == name}
    end 
end 


