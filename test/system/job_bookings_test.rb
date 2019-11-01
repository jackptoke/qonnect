require "application_system_test_case"

class JobBookingsTest < ApplicationSystemTestCase
  setup do
    @job_booking = job_bookings(:one)
  end

  test "visiting the index" do
    visit job_bookings_url
    assert_selector "h1", text: "Job Bookings"
  end

  test "creating a Job booking" do
    visit job_bookings_url
    click_on "New Job Booking"

    fill_in "Address", with: @job_booking.address_id
    fill_in "Appointment time", with: @job_booking.appointment_time
    fill_in "Booking description", with: @job_booking.booking_description
    fill_in "Booking length", with: @job_booking.booking_length
    fill_in "Booking title", with: @job_booking.booking_title
    fill_in "Client", with: @job_booking.client_id
    fill_in "Contact no", with: @job_booking.contact_no
    fill_in "Contact person", with: @job_booking.contact_person
    fill_in "Cost", with: @job_booking.cost
    fill_in "Further instruction", with: @job_booking.further_instruction
    fill_in "Job status", with: @job_booking.job_status
    fill_in "Number of interpreter", with: @job_booking.number_of_interpreter
    fill_in "Payment reference", with: @job_booking.payment_reference
    fill_in "Payment status", with: @job_booking.payment_status
    click_on "Create Job booking"

    assert_text "Job booking was successfully created"
    click_on "Back"
  end

  test "updating a Job booking" do
    visit job_bookings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @job_booking.address_id
    fill_in "Appointment time", with: @job_booking.appointment_time
    fill_in "Booking description", with: @job_booking.booking_description
    fill_in "Booking length", with: @job_booking.booking_length
    fill_in "Booking title", with: @job_booking.booking_title
    fill_in "Client", with: @job_booking.client_id
    fill_in "Contact no", with: @job_booking.contact_no
    fill_in "Contact person", with: @job_booking.contact_person
    fill_in "Cost", with: @job_booking.cost
    fill_in "Further instruction", with: @job_booking.further_instruction
    fill_in "Job status", with: @job_booking.job_status
    fill_in "Number of interpreter", with: @job_booking.number_of_interpreter
    fill_in "Payment reference", with: @job_booking.payment_reference
    fill_in "Payment status", with: @job_booking.payment_status
    click_on "Update Job booking"

    assert_text "Job booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Job booking" do
    visit job_bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job booking was successfully destroyed"
  end
end
