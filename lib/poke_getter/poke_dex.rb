class PokeDex
  # the poke dex is responsible for creating Poke objects from the stored dex
  attr_accessor :poke_dex, :pokes

  def initialize(poke_dex=[])
      @poke_dex = poke_dex
      @pokes = []
  end

  def create_pokes
      # create new Poke objects and add those instances
      self.pokes = self.poke_dex.each {|poke| Poke.new(poke=poke)}
  end
end