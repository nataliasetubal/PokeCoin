class PokemonSalesController < AuthenticatedController
  before_action :set_pokemon_sale, only: %i[ show ]

  # GET /pokemon_sales or /pokemon_sales.json
  def index
    @pokemon_sales = PokemonSale.all
  end

  # GET /pokemon_sales/new
  def new
    @pokemon_sale = PokemonSale.new
  end

  # POST /pokemon_sales or /pokemon_sales.json
  def create
    @pokemon_sale = PokemonSale.create(pokemon_sale_params)

    redirect_to pokemon_sales_path, notice: 'Nova aquisição de pokémon criada com sucesso.'
  rescue StandardError
    redirect_to pokemon_sales_path, notice: "Ocorreu um erro durante a criação da venda."
  end

  private
    # Only allow a list of trusted parameters through.
    def pokemon_sale_params
      params.require(:pokemon_sale).permit(:value)
    end
end
