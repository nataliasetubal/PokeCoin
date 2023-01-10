class AddUserIdToPokemons < ActiveRecord::Migration[7.0]
  def change
    change_table :pokemons do |t|
      t.belongs_to :user
    end
  end
end
