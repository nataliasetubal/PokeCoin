class CreatePokemonSales < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_sales do |t|
      t.decimal :value

      t.timestamps
    end
  end
end
