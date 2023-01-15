class Wallet < ApplicationRecord
  belongs_to :user

  def update_value
    pokemons_base_experience = Pokemon.where(user_id: user_id).pluck(:base_experience)

    pokemons_base_experience.each do |pokemon_base_experience|
      pokemon_value = ValueConverterToSatoshiService.new.convert(value: pokemon_base_experience)
      self.value += pokemon_value
    end

    save
  end
end
