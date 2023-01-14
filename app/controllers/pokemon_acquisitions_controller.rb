class PokemonAcquisitionsController < AuthenticatedController
  before_action :set_pokemon_acquisition, only: %i[show]

  def index
    @pokemon_acquisitions = PokemonAcquisition.all
  end

  def new
    @pokemon_acquisition = PokemonAcquisition.new
  end

  def create
    service = RegisterNewPokemonAcquisitionService.build
    @pokemon_acquisition = service.execute(pokemon_name: pokemon_name, user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to pokemon_acquisition_url(@pokemon_purchase), notice: 'Nova aquisição de pokémon criada com sucesso.' }
      format.json { render :show, status: :created, location: @pokemon_acquisition }
    end
  rescue PokemonApiException => e
    redirect_to pokemon_acquisitions_path, notice: e.message
  rescue StandardError
    redirect_to pokemon_acquisitions_path, notice: "Ocorreu um erro durante a criação da aquisição do novo pokémon."
  end

  private

  def set_pokemon_acquisition
    @pokemon_acquisition = PokemonAcquisition.find(params[:id])
  end

  def pokemon_name
    params.require(:pokemon_acquisition).require(:name)
  end
end
