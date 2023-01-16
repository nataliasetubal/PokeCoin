class RegisterNewPokemonAcquisitionService
  def self.build
    new(
      api: PokemonApi.build,
      pokemon_repository: Pokemon,
      pokemon_acquisition_repository: PokemonAcquisition
    )
  end

  def initialize(api:, pokemon_repository:, pokemon_acquisition_repository:)
    @api = api
    @pokemon_repository = pokemon_repository
    @pokemon_acquisition_repository = pokemon_acquisition_repository
  end

  def execute(pokemon_name:, user_id:)
    pokemon_acquisition = @pokemon_acquisition_repository.transaction do
      result = @api.get_pokemon_by_name(name: pokemon_name)
      base_experience = result['base_experience'] || 0
      pokemon = save_pokemon(name: pokemon_name, base_experience: base_experience, user_id: user_id)
      register_pokemon_acquisition(pokemon: pokemon, user_id: user_id)
    end

    pokemon_acquisition
  end

  private

  def save_pokemon(name:, base_experience:, user_id:)
    @pokemon_repository.create(name: name, base_experience: base_experience, user_id: user_id, sold: false)
  end

  def register_pokemon_acquisition(pokemon:, user_id:)
    @pokemon_acquisition_repository.create(pokemon_id: pokemon.id, user_id: user_id)
  end
end
