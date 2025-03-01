require "application_system_test_case"

class BuyersTest < ApplicationSystemTestCase
  setup do
    @buyer = buyers(:one)
  end

  test "visiting the index" do
    visit buyers_url
    assert_selector "h1", text: "Buyers"
  end

  test "creating a Buyer" do
    visit buyers_url
    click_on "New Buyer"

    fill_in "Birthday", with: @buyer.birthday
    fill_in "Email", with: @buyer.email
    fill_in "First name", with: @buyer.first_name
    fill_in "Last name", with: @buyer.last_name
    fill_in "Password digest", with: @buyer.password_digest
    fill_in "Sex", with: @buyer.sex
    click_on "Create Buyer"

    assert_text "Buyer was successfully created"
    click_on "Back"
  end

  test "updating a Buyer" do
    visit buyers_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @buyer.birthday
    fill_in "Email", with: @buyer.email
    fill_in "First name", with: @buyer.first_name
    fill_in "Last name", with: @buyer.last_name
    fill_in "Password digest", with: @buyer.password_digest
    fill_in "Sex", with: @buyer.sex
    click_on "Update Buyer"

    assert_text "Buyer was successfully updated"
    click_on "Back"
  end

  test "destroying a Buyer" do
    visit buyers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buyer was successfully destroyed"
  end
end
