class CheckWalletQuotationByUsdService
  include ActionView::Helpers::NumberHelper

  def self.build
    new(
      api: CriptoCurrency::BitcoinApi.build,
      wallet_repository: Wallet
    )
  end

  def initialize(api:, wallet_repository:)
    @api = api
    @wallet_repository = wallet_repository
  end

  def execute(user_id:)
    price_usd = current_price_usd
    wallet = user_wallet(user_id: user_id)
    wallet_value_in_usd(wallet_value: wallet.value, price_usd: price_usd)
  end

  private

  def user_wallet(user_id:)
    @wallet_repository.find_by!(user_id: user_id)
  end

  def current_price_usd
    currency = @api.currency
    currency.first['price_usd']
  end

  def wallet_value_in_usd(wallet_value:, price_usd: )
    number_to_currency(wallet_value * price_usd, precision: 10, strip_insignificant_zeros: true)
  end
end
