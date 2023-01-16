class PokemonAcquisitionsController < AuthenticatedController
  def index
    @pokemon_acquisitions = PokemonAcquisition.all.reverse_order
  end

  def new
    @pokemon_acquisition = PokemonAcquisition.new
  end

  def create
    service = RegisterNewPokemonAcquisitionService.build
    @pokemon_acquisition = service.execute(pokemon_name: pokemon_name, user_id: current_user.id)

    redirect_to pokemon_acquisitions_path, notice: 'Nova aquisição de pokémon criada com sucesso.'
  rescue PokemonApiException => e
    redirect_to pokemon_acquisitions_path, notice: e.message
  rescue StandardError => e
    redirect_to pokemon_acquisitions_path, notice: 'Ocorreu um erro durante a criação da aquisição do novo pokémon.'
  end

  private

  def pokemon_name
    name = params.require(:pokemon_acquisition).require(:name)
    name.gsub!(' ', '-')
    name.downcase
  end
end
