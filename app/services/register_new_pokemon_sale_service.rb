class RegisterNewPokemonSaleService
  def self.build
    new(
      api: CriptoCurrency::BitcoinApi.build,
      pokemon_sales_repository: PokemonSale,
      pokemon_repository: Pokemon
    )
  end

  def initialize(api:, pokemon_repository:, pokemon_sales_repository:)
    @api = api
    @pokemon_repository = pokemon_repository
    @pokemon_sales_repository = pokemon_sales_repository
  end

  def execute(id:, user_id:)
    pokemon = pokemon_repository.find(id)
    pokemon.sell!

    register_pokemon_sale(pokemon: pokemon, user_id: user_id)
  end

  def register_pokemon_sale(pokemon:, user_id:)
    @pokemon_sales_repository.create(pokemon_id: pokemon.id, user_id: user_id)
  end
end
