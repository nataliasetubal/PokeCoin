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
  rescue RestClient::NotFound
    raise_pokemon_not_found(name: name)
  rescue RestClient::Exception
    raise_api_exception
  end

  private

  def format_url(name)
    "#{@url}#{name}/"
  end

  def raise_pokemon_not_found(name:)
    raise PokemonNotFound.new(name: name)
  end

  def raise_api_exception
    raise PokemonApiException.new
  end
end
