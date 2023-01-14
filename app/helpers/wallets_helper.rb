module WalletsHelper
  def wallet_value_in_usd
    service = CheckWalletQuotationByUsdService.build
    service.execute(user_id: current_user.id)
  end

  def number_of_pokemons
    Pokemon.where(user_id: current_user.id).count
  end
end
