class Hashit
  attr_accessor :key_list

  def initialize(hash)
    @key_list = []
    self.convert_to_obj(hash)
  end

  def convert_to_obj(h)
    h.each do |k,v|
        new_k = format_key(k)
        save_key(new_k)
        self.class.send(:attr_accessor, new_k)
        instance_variable_set("@#{new_k}", v) 
        convert_to_obj(v) if v.is_a? Hash
    end
  end

  def format_key(k)
    if k.include? "-"
      new_k = k.gsub("\-", "_")
      return new_k
    else
      return k
    end
  end

  def save_key(k)
    self.key_list << k
  end

end