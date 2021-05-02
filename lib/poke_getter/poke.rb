class Poke
    attr_accessor :name, :url, :details, :attributes_list

    # an array of poke_obj
    @@all = []
    # lets start small
    @@counter = 0

    def initialize(dex_obj)
        @name = dex_obj["name"]
        @url = dex_obj["url"]
        @details = nil
        @attributes_list = []
        self.save
        @@counter += 1
    end

    # the basics. can be abstracted away to a service class.
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.count
        @@counter
    end

    # this can be modified. suffices for development
    def self.list
        @@all.each {|pk| print "#{pk.name}\n"}
    end

    # query by name; user input must be correct
    def self.find_poke_by_name(name)
         @@all.find{|poke| poke.name.downcase === name.downcase }
    end

    # this does the work of getting more data from many urls
    # is called by get_details.
    def get_data_from_url
        json = RestClient.get(self.url)
        data = JSON.parse(json)
        return data
    end

    # note: pokeman have lots of little details.
    # gets called by user.
    def get_details
        hash = self.get_data_from_url
        self.details = Hashit.new(hash)
    end

    # user will be be prompted to get a list of all available attributes for a poke
    def create_attributes_list
        # list will be queried by user
        self.details.key_list.each do |key| 
            if !key.include? "_"
                self.attributes_list << key
            else
                new_key = key.gsub("\_", " ")
                self.attributes_list << new_key
            end
        end       
    end

    # check for duplicate attributes. there should be many. whats the real deal with them?
    def evaluate_attributes_list
        # set variable for simplicity
        a = self.attributes_list
        # check frequency of word
        freq = Hash.new(0)
        a.each {|x| freq[x] +=1}
        b = Array.new
        freq.map{|key, value| "#{key}x#{value}" if value > 1}
        return b
    end

    # gets attribute details from user input (types a name from a list) and returns the
    def get_attribute(name)
        new_name = name.gsub("\ ", "_")
        symbol = new_name.to_sym
        self.details.send(symbol)
        binding.pry
    end

end
