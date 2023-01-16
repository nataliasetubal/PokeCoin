class PokemonAlreadySold < StandardError
  def initialize(pokemon:)
    super("O pokemon #{pokemon.name} já foi vendido.")
  end
end