require 'test_helper'

class JobBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_booking = job_bookings(:one)
  end

  test "should get index" do
    get job_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_job_booking_url
    assert_response :success
  end

  test "should create job_booking" do
    assert_difference('JobBooking.count') do
      post job_bookings_url, params: { job_booking: { address_id: @job_booking.address_id, appointment_time: @job_booking.appointment_time, booking_description: @job_booking.booking_description, booking_length: @job_booking.booking_length, booking_title: @job_booking.booking_title, client_id: @job_booking.client_id, contact_no: @job_booking.contact_no, contact_person: @job_booking.contact_person, cost: @job_booking.cost, further_instruction: @job_booking.further_instruction, job_status: @job_booking.job_status, number_of_interpreter: @job_booking.number_of_interpreter, payment_reference: @job_booking.payment_reference, payment_status: @job_booking.payment_status } }
    end

    assert_redirected_to job_booking_url(JobBooking.last)
  end

  test "should show job_booking" do
    get job_booking_url(@job_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_booking_url(@job_booking)
    assert_response :success
  end

  test "should update job_booking" do
    patch job_booking_url(@job_booking), params: { job_booking: { address_id: @job_booking.address_id, appointment_time: @job_booking.appointment_time, booking_description: @job_booking.booking_description, booking_length: @job_booking.booking_length, booking_title: @job_booking.booking_title, client_id: @job_booking.client_id, contact_no: @job_booking.contact_no, contact_person: @job_booking.contact_person, cost: @job_booking.cost, further_instruction: @job_booking.further_instruction, job_status: @job_booking.job_status, number_of_interpreter: @job_booking.number_of_interpreter, payment_reference: @job_booking.payment_reference, payment_status: @job_booking.payment_status } }
    assert_redirected_to job_booking_url(@job_booking)
  end

  test "should destroy job_booking" do
    assert_difference('JobBooking.count', -1) do
      delete job_booking_url(@job_booking)
    end

    assert_redirected_to job_bookings_url
  end
end
