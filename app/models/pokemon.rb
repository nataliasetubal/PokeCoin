class Pokemon < ApplicationRecord
  belongs_to :user

  def sell!
    raise_pokemon_already_sold_error if sold
    self.sold = true
    save
  end

  def raise_pokemon_already_sold_error(pokemon)
    PokemonAlreadySoldError.new(pokemon)
  end
end
