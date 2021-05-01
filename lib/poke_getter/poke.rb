class Poke
    attr_accessor :name, :url, :more, :details

    # an array of poke_obj
    @@all = []
    @@counter = 0

    def initialize(poke)
        @name = poke["name"]
        @url = poke["url"]
        @more = nil
        @details = []
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

    # this can be very well modified. suffices.
    def self.list
        @@all.each {|pk| print "#{pk.name}\n"}
    end

    # this does the work of getting more data from many urls
    def self.get_more_from_url(poke_obj)
        json = RestClient.get(poke_obj.url)
        data = JSON.parse(json)
        poke_obj.more = data
        poke_obj.save
    end

    # query by name; user input must be correct
    def self.find_poke_by_name(name)
         @@all.find{|poke| poke.name.downcase === name.downcase }
    end

    # note: pokeman have lots of little details.
    # another class will handle creating the attributes, the detailer
    def self.get_all_details(poke_obj)
        if poke_obj.more = nil
            self.get_more_from_url(poke_obj)
            poke_obj.details <<
        else
            
        end
    end
    
end




# attrs = [@abilities, @base_experience, @forms, @game_indices, @height, @held_items, @id, @is_default, @location_area_encounters, @moves, @name, @order, @past_types, @species, @sprites, @stats, @types, @weight ]
        
# poke.more["abilities"] = attrs[0]
# poke.more["base_experience"] = attrs[1]
# poke.more["forms"] = attrs[2]
# poke.more["game_indices"] = attrs[3]
# poke.more["height"] = attrs[4]
# poke.more["held_items"] = attrs[5]
# poke.more["id"] = attrs[6]
# poke.more["is_default"] = attrs[7]
# poke.more["location_area_encounters"] = attrs[8]
# poke.more["moves"] = attrs[9]
# poke.more["name"] = attrs[10]
# poke.more["order"] = attrs[11]
# poke.more["past_types"] = attrs[12]
# poke.more["species"] = attrs[13]
# poke.more["sprites"] = attrs[14]
# poke.more["stats"] = attrs[15]
# poke.more["types"] = attrs[16]
# poke.more["weight"] = attrs[17]
# return poke


# , :abilities, :base_experience, :forms, :game_indices, :height, :held_items, :id, :is_default, :location_area_encounters, :moves, :name, :order, :past_types, :species, :sprites, :stats, :types, :weight