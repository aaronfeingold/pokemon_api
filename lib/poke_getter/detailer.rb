class Detailer
  @@attr_list = []
  attr_accessor(*@@attr_list)

  def self.get_attrs(details)
    details.collect{|key,value| @@attr_list << key.to_sym}
  end

end