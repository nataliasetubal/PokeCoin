class AddNullValidationToPokemonColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:pokemons, :name, false)
    change_column_null(:pokemons, :base_experience, false)
  end
end
