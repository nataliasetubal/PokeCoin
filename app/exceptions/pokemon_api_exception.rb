class PokemonApiException < StandardError
  def initialize(message = 'Ocorreu um erro inesperado.')
    super(message)
  end
end
