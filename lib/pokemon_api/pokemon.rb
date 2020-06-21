class Pokemon
    attr_accessor :name, :url, :abilities, :moves, :types
    
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
    
    def find_all_by_name(name)
        self.all.find {|obj| obj.name == name}
    end 

    def find_all_by_type(type)
        self.all.find { |obj| object.type == type}
    end

end 


