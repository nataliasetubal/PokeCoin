class ChangePokemonPurchasesToPokemonAcquisitions < ActiveRecord::Migration[7.0]
  def change
    rename_table :pokemon_purchases, :pokemon_acquisitions
  end
end
