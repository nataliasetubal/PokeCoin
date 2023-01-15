class Wallet < ApplicationRecord
  belongs_to :user

  def update_value
    pokemons_base_experience = Pokemon.where(user_id: user_id, sold: false).pluck(:base_experience)

    self.value = 0

    if pokemons_base_experience.present?
      pokemons_base_experience.each do |pokemon_base_experience|
        pokemon_value = ValueConverterToSatoshiService.new.convert(value: pokemon_base_experience)
        self.value += pokemon_value
      end
    end

    save
  end
end
