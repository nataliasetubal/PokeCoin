class PokemonApi
  URL = 'https://pokeapi.co/api/v2/pokemon/'.freeze

  def self.build
    new(
      url: URL,
      api: RestClient
    )
  end

  def initialize(url:, api:)
    @url = url
    @api = api
  end

  def get_pokemon_by_name(name:)
    response = @api.get(format_url(name))
    JSON.parse(response)
  end

  private

  def format_url(name)
    "#{@url}#{name}/"
  end
end
