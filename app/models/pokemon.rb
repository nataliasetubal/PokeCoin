class Pokemon < ApplicationRecord
  belongs_to :user
  has_one :pokemon_acquisition, ->(id) { where('pokemon_id = ?', id) }

  def sell!
    raise_pokemon_already_sold_error if sold
    self.sold = true
    save
  end

  private

  def raise_pokemon_already_sold_error(pokemon)
    PokemonAlreadySoldError.new(pokemon)
  end
end
