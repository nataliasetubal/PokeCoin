class PokemonAcquisition < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
end
