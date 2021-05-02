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
    def get_data_from_url
        json = RestClient.get(self.url)
        data = JSON.parse(json)
        return data
    end

    # note: pokeman have lots of little details.
    def get_details
        hash = self.get_data_from_url
        self.details = Hashit.new(hash)
    end

    # user will be be prompted to get a list of all available attributes for a poke
    def create_attributes_list
        # list will be quereied by user
        self.details.key_list.each do |key| 
            if !key.include? "_"
                self.attributes_list << key
            else
                new_key = key.gsub("\_", " ")
                self.attributes_list << new_key
            end
        end       
    end

    # gets name of attribute from user and returns the
    def get_attribute(name)
        new_name = name.gsub("\ ", "_")
        symbol = new_name.to_sym
        self.details.send(symbol)
        binding.pry
    end

end
