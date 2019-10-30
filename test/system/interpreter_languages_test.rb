require "application_system_test_case"

class InterpreterLanguagesTest < ApplicationSystemTestCase
  setup do
    @interpreter_language = interpreter_languages(:one)
  end

  test "visiting the index" do
    visit interpreter_languages_url
    assert_selector "h1", text: "Interpreter Languages"
  end

  test "creating a Interpreter language" do
    visit interpreter_languages_url
    click_on "New Interpreter Language"

    fill_in "Interpreter", with: @interpreter_language.interpreter_id
    fill_in "Language", with: @interpreter_language.language_id
    click_on "Create Interpreter language"

    assert_text "Interpreter language was successfully created"
    click_on "Back"
  end

  test "updating a Interpreter language" do
    visit interpreter_languages_url
    click_on "Edit", match: :first

    fill_in "Interpreter", with: @interpreter_language.interpreter_id
    fill_in "Language", with: @interpreter_language.language_id
    click_on "Update Interpreter language"

    assert_text "Interpreter language was successfully updated"
    click_on "Back"
  end

  test "destroying a Interpreter language" do
    visit interpreter_languages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interpreter language was successfully destroyed"
  end
end
