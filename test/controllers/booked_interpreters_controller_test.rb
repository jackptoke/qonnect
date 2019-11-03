require 'test_helper'

class BookedInterpretersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booked_interpreter = booked_interpreters(:one)
  end

  test "should get index" do
    get booked_interpreters_url
    assert_response :success
  end

  test "should get new" do
    get new_booked_interpreter_url
    assert_response :success
  end

  test "should create booked_interpreter" do
    assert_difference('BookedInterpreter.count') do
      post booked_interpreters_url, params: { booked_interpreter: { interpreter_id: @booked_interpreter.interpreter_id, interpreter_remark: @booked_interpreter.interpreter_remark, job_booking_id: @booked_interpreter.job_booking_id, time_interpreter_arrived: @booked_interpreter.time_interpreter_arrived, time_interpreter_finished: @booked_interpreter.time_interpreter_finished, time_interpreter_started: @booked_interpreter.time_interpreter_started } }
    end

    assert_redirected_to booked_interpreter_url(BookedInterpreter.last)
  end

  test "should show booked_interpreter" do
    get booked_interpreter_url(@booked_interpreter)
    assert_response :success
  end

  test "should get edit" do
    get edit_booked_interpreter_url(@booked_interpreter)
    assert_response :success
  end

  test "should update booked_interpreter" do
    patch booked_interpreter_url(@booked_interpreter), params: { booked_interpreter: { interpreter_id: @booked_interpreter.interpreter_id, interpreter_remark: @booked_interpreter.interpreter_remark, job_booking_id: @booked_interpreter.job_booking_id, time_interpreter_arrived: @booked_interpreter.time_interpreter_arrived, time_interpreter_finished: @booked_interpreter.time_interpreter_finished, time_interpreter_started: @booked_interpreter.time_interpreter_started } }
    assert_redirected_to booked_interpreter_url(@booked_interpreter)
  end

  test "should destroy booked_interpreter" do
    assert_difference('BookedInterpreter.count', -1) do
      delete booked_interpreter_url(@booked_interpreter)
    end

    assert_redirected_to booked_interpreters_url
  end
end
