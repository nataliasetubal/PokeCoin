module CriptoCurrency
  class BitcoinApi
    URL = 'https://rest.coinapi.io/v1/assets/BTC'.freeze

    def self.build
      new(
        url: URL,
        api: RestClient,
        api_key: ENV['coin_api_key']
      )
    end

    def initialize(url:, api:, api_key:)
      @url = url
      @api = api
      @api_key = api_key
    end

    def currency
      response = @api.get(@url, { 'X-CoinAPI-Key' => @api_key })
      JSON.parse(response)
    end
  end
end
