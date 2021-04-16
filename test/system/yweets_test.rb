require "application_system_test_case"

class YweetsTest < ApplicationSystemTestCase
  setup do
    @yweet = yweets(:one)
  end

  test "visiting the index" do
    visit yweets_url
    assert_selector "h1", text: "Yweets"
  end

  test "creating a Yweet" do
    visit yweets_url
    click_on "New Yweet"

    fill_in "Yweet", with: @yweet.yweet
    click_on "Create Yweet"

    assert_text "Yweet was successfully created"
    click_on "Back"
  end

  test "updating a Yweet" do
    visit yweets_url
    click_on "Edit", match: :first

    fill_in "Yweet", with: @yweet.yweet
    click_on "Update Yweet"

    assert_text "Yweet was successfully updated"
    click_on "Back"
  end

  test "destroying a Yweet" do
    visit yweets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yweet was successfully destroyed"
  end
end
