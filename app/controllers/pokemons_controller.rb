class PokemonsController < AuthenticatedController
  before_action :set_pokemon, only: %i[show]

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :sold)
  end
end
