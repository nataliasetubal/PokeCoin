class ValueConverterToSatoshiService
  SATOSHI_VALUE = 0.00000001

  def convert(value:)
    value.to_f * SATOSHI_VALUE
  end
end