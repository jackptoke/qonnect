require "application_system_test_case"

class BookedInterpretersTest < ApplicationSystemTestCase
  setup do
    @booked_interpreter = booked_interpreters(:one)
  end

  test "visiting the index" do
    visit booked_interpreters_url
    assert_selector "h1", text: "Booked Interpreters"
  end

  test "creating a Booked interpreter" do
    visit booked_interpreters_url
    click_on "New Booked Interpreter"

    fill_in "Interpreter", with: @booked_interpreter.interpreter_id
    fill_in "Interpreter remark", with: @booked_interpreter.interpreter_remark
    fill_in "Job booking", with: @booked_interpreter.job_booking_id
    fill_in "Time interpreter arrived", with: @booked_interpreter.time_interpreter_arrived
    fill_in "Time interpreter finished", with: @booked_interpreter.time_interpreter_finished
    fill_in "Time interpreter started", with: @booked_interpreter.time_interpreter_started
    click_on "Create Booked interpreter"

    assert_text "Booked interpreter was successfully created"
    click_on "Back"
  end

  test "updating a Booked interpreter" do
    visit booked_interpreters_url
    click_on "Edit", match: :first

    fill_in "Interpreter", with: @booked_interpreter.interpreter_id
    fill_in "Interpreter remark", with: @booked_interpreter.interpreter_remark
    fill_in "Job booking", with: @booked_interpreter.job_booking_id
    fill_in "Time interpreter arrived", with: @booked_interpreter.time_interpreter_arrived
    fill_in "Time interpreter finished", with: @booked_interpreter.time_interpreter_finished
    fill_in "Time interpreter started", with: @booked_interpreter.time_interpreter_started
    click_on "Update Booked interpreter"

    assert_text "Booked interpreter was successfully updated"
    click_on "Back"
  end

  test "destroying a Booked interpreter" do
    visit booked_interpreters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booked interpreter was successfully destroyed"
  end
end
