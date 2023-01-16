class PokemonsController < AuthenticatedController

  def index
    @pokemons = Pokemon.all
  end

end
