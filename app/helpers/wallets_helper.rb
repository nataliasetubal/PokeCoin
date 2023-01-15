module WalletsHelper
  include ActionView::Helpers::NumberHelper

  def wallet_value_in_usd
    service = CheckWalletQuotationByUsdService.build
    service.execute(user_id: current_user.id)
  end

  def wallet_value_with_precision(value)
    number_to_currency(value, precision: 10, strip_insignificant_zeros: true)
  end

  def number_of_pokemons
    Pokemon.where(user_id: current_user.id).count
  end
end
