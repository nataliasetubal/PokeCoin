require "test_helper"

class PokemonSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_sale = pokemon_sales(:one)
  end

  test "should get index" do
    get pokemon_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_sale_url
    assert_response :success
  end

  test "should create pokemon_sale" do
    assert_difference("PokemonSale.count") do
      post pokemon_sales_url, params: { pokemon_sale: { value: @pokemon_sale.value } }
    end

    assert_redirected_to pokemon_sale_url(PokemonSale.last)
  end

  test "should show pokemon_sale" do
    get pokemon_sale_url(@pokemon_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_sale_url(@pokemon_sale)
    assert_response :success
  end

  test "should update pokemon_sale" do
    patch pokemon_sale_url(@pokemon_sale), params: { pokemon_sale: { value: @pokemon_sale.value } }
    assert_redirected_to pokemon_sale_url(@pokemon_sale)
  end

  test "should destroy pokemon_sale" do
    assert_difference("PokemonSale.count", -1) do
      delete pokemon_sale_url(@pokemon_sale)
    end

    assert_redirected_to pokemon_sales_url
  end
end
