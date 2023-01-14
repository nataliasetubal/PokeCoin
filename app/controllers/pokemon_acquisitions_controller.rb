class PokemonAcquisitionsController < AuthenticatedController
  before_action :set_pokemon_acquisition, only: %i[show]

  def index
    @pokemon_acquisitions = PokemonAcquisition.all
  end

  def show; end

  def new
    @pokemon_acquisition = PokemonAcquisition.new
  end

  def create
    service = RegisterNewPokemonAcquisitionService.build
    @pokemon_acquisition = service.execute(pokemon_name: pokemon_name, user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to pokemon_acquisition_url(@pokemon_purchase), notice: 'Pokemon acquisition was successfully created.' }
      format.json { render :show, status: :created, location: @pokemon_acquisition }
    end
  rescue StandardError => e
    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @pokemon_acquisition.errors, status: :unprocessable_entity }
    end
  end

  private

  def set_pokemon_purchase
    @pokemon_acquisition = PokemonAcquisition.find(params[:id])
  end

  def pokemon_name
    params.require(:pokemon_purchase).require(:name)
  end
end
