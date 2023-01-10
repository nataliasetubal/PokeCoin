class AddUserIdAndPokemonIdToPokemonSales < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemon_sales, :user, foreign_key: true
    add_reference :pokemon_sales, :pokemon, foreign_key: true
  end
end
