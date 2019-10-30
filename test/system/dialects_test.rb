require "application_system_test_case"

class DialectsTest < ApplicationSystemTestCase
  setup do
    @dialect = dialects(:one)
  end

  test "visiting the index" do
    visit dialects_url
    assert_selector "h1", text: "Dialects"
  end

  test "creating a Dialect" do
    visit dialects_url
    click_on "New Dialect"

    fill_in "Dialect name", with: @dialect.dialect_name
    fill_in "Language", with: @dialect.language_id
    click_on "Create Dialect"

    assert_text "Dialect was successfully created"
    click_on "Back"
  end

  test "updating a Dialect" do
    visit dialects_url
    click_on "Edit", match: :first

    fill_in "Dialect name", with: @dialect.dialect_name
    fill_in "Language", with: @dialect.language_id
    click_on "Update Dialect"

    assert_text "Dialect was successfully updated"
    click_on "Back"
  end

  test "destroying a Dialect" do
    visit dialects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dialect was successfully destroyed"
  end
end
