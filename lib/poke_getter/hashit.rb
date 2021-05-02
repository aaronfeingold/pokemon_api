class Hashit
  attr_accessor :key_list

  def initialize(hash)
    @key_list = []
    self.convert_to_obj(hash)
  end

  def convert_to_obj(h)
    h.each do |k,v|
        # save it in its unmodified state to use as dictionary later
        save_key(k)
        # clean it so it can become an attr_accessor
        param = paramatize(k)
        self.class.send(:attr_accessor, param)
        # call class method to set an instance variable. interpolate the param with @, set to value
        instance_variable_set("@#{param}", v)
        # recursive function. if the value is a hash, keep going 
        convert_to_obj(v) if v.is_a? Hash
    end
  end

  def paramatize(k)
    # get rid of peksy dashes
    if k.include? "-"
      new_k = k.gsub("\-", "_")
      return new_k
    else
      return k
    end
  end

  def save_key(k)
    # we'll be needing this
    self.key_list << k
  end

end