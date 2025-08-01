require "application_system_test_case"

class OrderedItemsTest < ApplicationSystemTestCase
  setup do
    @ordered_item = ordered_items(:one)
  end

  test "visiting the index" do
    visit ordered_items_url
    assert_selector "h1", text: "Ordered items"
  end

  test "should create ordered item" do
    visit ordered_items_url
    click_on "New ordered item"

    fill_in "Order", with: @ordered_item.order_id
    fill_in "Price in cents", with: @ordered_item.price_in_cents
    fill_in "Product", with: @ordered_item.product_id
    fill_in "Quantity", with: @ordered_item.quantity
    click_on "Create Ordered item"

    assert_text "Ordered item was successfully created"
    click_on "Back"
  end

  test "should update Ordered item" do
    visit ordered_item_url(@ordered_item)
    click_on "Edit this ordered item", match: :first

    fill_in "Order", with: @ordered_item.order_id
    fill_in "Price in cents", with: @ordered_item.price_in_cents
    fill_in "Product", with: @ordered_item.product_id
    fill_in "Quantity", with: @ordered_item.quantity
    click_on "Update Ordered item"

    assert_text "Ordered item was successfully updated"
    click_on "Back"
  end

  test "should destroy Ordered item" do
    visit ordered_item_url(@ordered_item)
    click_on "Destroy this ordered item", match: :first

    assert_text "Ordered item was successfully destroyed"
  end
end
