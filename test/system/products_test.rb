require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "P available" if @product.p_available
    fill_in "P description", with: @product.p_description
    fill_in "P name", with: @product.p_name
    fill_in "P price", with: @product.p_price
    fill_in "P quantify", with: @product.p_quantify
    fill_in "P send", with: @product.p_send
    fill_in "User", with: @product.user_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "P available" if @product.p_available
    fill_in "P description", with: @product.p_description
    fill_in "P name", with: @product.p_name
    fill_in "P price", with: @product.p_price
    fill_in "P quantify", with: @product.p_quantify
    fill_in "P send", with: @product.p_send
    fill_in "User", with: @product.user_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
