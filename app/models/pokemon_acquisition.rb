class PokemonAcquisition < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  after_save :update_wallet_value

  private

  def update_wallet_value
    wallet = Wallet.find(user.id)
    wallet.update_value
  end
end
