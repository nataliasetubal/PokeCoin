class PokemonAcquisition < ApplicationRecord
  belongs_to :user
  has_one :pokemon
end
