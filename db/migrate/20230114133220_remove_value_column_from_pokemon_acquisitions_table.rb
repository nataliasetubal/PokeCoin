class RemoveValueColumnFromPokemonAcquisitionsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column(:pokemon_acquisitions, :value)
  end
end
