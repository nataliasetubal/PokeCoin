class Pokemon < ApplicationRecord
  belongs_to :user
  has_one :pokemon_acquisition, ->(id) { where('pokemon_id = ?', id) }

  include ActionView::Helpers::NumberHelper

  SATOSHI_VALUE = 0.00000001

  def sell!
    raise_pokemon_already_sold_error if sold
    self.sold = true
    save
  end

  def value_in_satoshis
    number_to_currency(base_experience * SATOSHI_VALUE, precision: 10, strip_insignificant_zeros: true)
  end

  private

  def raise_pokemon_already_sold_error(pokemon)
    PokemonAlreadySoldError.new(pokemon)
  end
end
