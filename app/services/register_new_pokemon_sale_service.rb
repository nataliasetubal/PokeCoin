class RegisterNewPokemonSaleService
  def self.build
    new(
      api: CriptoCurrency::BitcoinApi.build,
      pokemon_sales_repository: PokemonSale,
      pokemon_repository: Pokemon,
      converter: ValueConverterToSatoshiService.new
    )
  end

  def initialize(api:, pokemon_repository:, pokemon_sales_repository:, converter:)
    @api = api
    @pokemon_repository = pokemon_repository
    @pokemon_sales_repository = pokemon_sales_repository
    @converter = converter
  end

  def execute(pokemon_id:, user_id:)
    pokemon_sale = @pokemon_repository.transaction do
      pokemon = @pokemon_repository.find(pokemon_id)
      pokemon.sell!
      value = @converter.convert(value: pokemon.base_experience)
      register_pokemon_sale(pokemon: pokemon, user_id: user_id, value: value)
    end

    pokemon_sale
  end

  def register_pokemon_sale(pokemon:, user_id:, value:)
    @pokemon_sales_repository.create(pokemon_id: pokemon.id, user_id: user_id, value: value)
  end
end
