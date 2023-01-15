module PokemonSalesHelper
  include ActionView::Helpers::NumberHelper

  def not_sold_pokemons
    Pokemon.where(sold: false).pluck(:name, :id)
  end

  def value_with_precision(value)
    number_to_currency(value, precision: 10, strip_insignificant_zeros: true)
  end
end
