class PokemonNotFound < PokemonApiException
  def initialize(name:)
    super("O pokemon #{name} não foi encontrado.")
  end
end