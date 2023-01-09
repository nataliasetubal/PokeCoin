require "application_system_test_case"

class PokemonPurchasesTest < ApplicationSystemTestCase
  setup do
    @pokemon_purchase = pokemon_purchases(:one)
  end

  test "visiting the index" do
    visit pokemon_purchases_url
    assert_selector "h1", text: "Pokemon purchases"
  end

  test "should create pokemon purchase" do
    visit pokemon_purchases_url
    click_on "New pokemon purchase"

    fill_in "Value", with: @pokemon_purchase.value
    click_on "Create Pokemon purchase"

    assert_text "Pokemon purchase was successfully created"
    click_on "Back"
  end

  test "should update Pokemon purchase" do
    visit pokemon_purchase_url(@pokemon_purchase)
    click_on "Edit this pokemon purchase", match: :first

    fill_in "Value", with: @pokemon_purchase.value
    click_on "Update Pokemon purchase"

    assert_text "Pokemon purchase was successfully updated"
    click_on "Back"
  end

  test "should destroy Pokemon purchase" do
    visit pokemon_purchase_url(@pokemon_purchase)
    click_on "Destroy this pokemon purchase", match: :first

    assert_text "Pokemon purchase was successfully destroyed"
  end
end
