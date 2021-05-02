class PokeDex
  # the poke dex is responsible for creating Pokemon (poke_objs)
  attr_accessor :poke_objs

  def initialize(poke_dex)
      @poke_objs = self.create_poke_objs(poke_dex)
  end

  # create new Poke objects and add those instances to an array
  def create_poke_objs(dex)
      dex.map {|dex_obj| Poke.new(dex_obj)}
  end

end