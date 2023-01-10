class AddUserIdAndPokemonIdToPokemonPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemon_purchases, :user, foreign_key: true
    add_reference :pokemon_purchases, :pokemon, foreign_key: true
  end
end
