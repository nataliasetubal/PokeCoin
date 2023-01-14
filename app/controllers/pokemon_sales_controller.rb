class PokemonSalesController < AuthenticatedController
  before_action :set_pokemon_sale, only: %i[ show ]

  # GET /pokemon_sales or /pokemon_sales.json
  def index
    @pokemon_sales = PokemonSale.all
  end

  # GET /pokemon_sales/1 or /pokemon_sales/1.json
  def show
  end

  # GET /pokemon_sales/new
  def new
    @pokemon_sale = PokemonSale.new
  end

  # POST /pokemon_sales or /pokemon_sales.json
  def create
    @pokemon_sale = PokemonSale.new(pokemon_sale_params)

    respond_to do |format|
      if @pokemon_sale.save
        format.html { redirect_to pokemon_sale_url(@pokemon_sale), notice: "Pokemon sale was successfully created." }
        format.json { render :show, status: :created, location: @pokemon_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_sale
      @pokemon_sale = PokemonSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_sale_params
      params.require(:pokemon_sale).permit(:value)
    end
end
