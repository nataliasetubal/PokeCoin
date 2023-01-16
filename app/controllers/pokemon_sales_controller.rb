class PokemonSalesController < AuthenticatedController
  before_action :set_pokemon_sale, only: %i[show]

  # GET /pokemon_sales or /pokemon_sales.json
  def index
    @pokemon_sales = PokemonSale.all.reverse_order
  end

  # POST /pokemon_sales or /pokemon_sales.json
  def create
    service = RegisterNewPokemonSaleService.build
    @pokemon_sale = service.execute(pokemon_id: pokemon_id, user_id: current_user.id)

    redirect_to pokemon_sales_path, notice: 'Pokémon vendido com sucesso.'
  rescue PokemonAlreadySold => e
    redirect_to pokemon_sales_path, notice: e.message
  rescue StandardError => e
    redirect_to pokemon_sales_path, notice: 'Ocorreu um erro durante a criação da venda.'
  end

  private

  def pokemon_id
    params[:pokemon_id]
  end
end
