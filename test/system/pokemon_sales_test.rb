require "application_system_test_case"

class PokemonSalesTest < ApplicationSystemTestCase
  setup do
    @pokemon_sale = pokemon_sales(:one)
  end

  test "visiting the index" do
    visit pokemon_sales_url
    assert_selector "h1", text: "Pokemon sales"
  end

  test "should create pokemon sale" do
    visit pokemon_sales_url
    click_on "New pokemon sale"

    fill_in "Value", with: @pokemon_sale.value
    click_on "Create Pokemon sale"

    assert_text "Pokemon sale was successfully created"
    click_on "Back"
  end

  test "should update Pokemon sale" do
    visit pokemon_sale_url(@pokemon_sale)
    click_on "Edit this pokemon sale", match: :first

    fill_in "Value", with: @pokemon_sale.value
    click_on "Update Pokemon sale"

    assert_text "Pokemon sale was successfully updated"
    click_on "Back"
  end

  test "should destroy Pokemon sale" do
    visit pokemon_sale_url(@pokemon_sale)
    click_on "Destroy this pokemon sale", match: :first

    assert_text "Pokemon sale was successfully destroyed"
  end
end
