class AddPrecisionToTheValueColumnOfPokemonSales < ActiveRecord::Migration[7.0]
  def change
    change_column(:pokemon_sales, :value, :decimal,  precision: 5, scale: 2)
  end
end
