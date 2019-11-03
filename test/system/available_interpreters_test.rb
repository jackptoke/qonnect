require "application_system_test_case"

class AvailableInterpretersTest < ApplicationSystemTestCase
  setup do
    @available_interpreter = available_interpreters(:one)
  end

  test "visiting the index" do
    visit available_interpreters_url
    assert_selector "h1", text: "Available Interpreters"
  end

  test "creating a Available interpreter" do
    visit available_interpreters_url
    click_on "New Available Interpreter"

    fill_in "Interpreter", with: @available_interpreter.interpreter_id
    fill_in "Job booking", with: @available_interpreter.job_booking_id
    click_on "Create Available interpreter"

    assert_text "Available interpreter was successfully created"
    click_on "Back"
  end

  test "updating a Available interpreter" do
    visit available_interpreters_url
    click_on "Edit", match: :first

    fill_in "Interpreter", with: @available_interpreter.interpreter_id
    fill_in "Job booking", with: @available_interpreter.job_booking_id
    click_on "Update Available interpreter"

    assert_text "Available interpreter was successfully updated"
    click_on "Back"
  end

  test "destroying a Available interpreter" do
    visit available_interpreters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Available interpreter was successfully destroyed"
  end
end
