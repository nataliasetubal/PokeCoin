require "test_helper"

class PokemonPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_purchase = pokemon_purchases(:one)
  end

  test "should get index" do
    get pokemon_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_purchase_url
    assert_response :success
  end

  test "should create pokemon_purchase" do
    assert_difference("PokemonPurchase.count") do
      post pokemon_purchases_url, params: { pokemon_purchase: { value: @pokemon_purchase.value } }
    end

    assert_redirected_to pokemon_purchase_url(PokemonPurchase.last)
  end

  test "should show pokemon_purchase" do
    get pokemon_purchase_url(@pokemon_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_purchase_url(@pokemon_purchase)
    assert_response :success
  end

  test "should update pokemon_purchase" do
    patch pokemon_purchase_url(@pokemon_purchase), params: { pokemon_purchase: { value: @pokemon_purchase.value } }
    assert_redirected_to pokemon_purchase_url(@pokemon_purchase)
  end

  test "should destroy pokemon_purchase" do
    assert_difference("PokemonPurchase.count", -1) do
      delete pokemon_purchase_url(@pokemon_purchase)
    end

    assert_redirected_to pokemon_purchases_url
  end
end
