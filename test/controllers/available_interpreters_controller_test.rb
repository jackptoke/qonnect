require 'test_helper'

class AvailableInterpretersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_interpreter = available_interpreters(:one)
  end

  test "should get index" do
    get available_interpreters_url
    assert_response :success
  end

  test "should get new" do
    get new_available_interpreter_url
    assert_response :success
  end

  test "should create available_interpreter" do
    assert_difference('AvailableInterpreter.count') do
      post available_interpreters_url, params: { available_interpreter: { interpreter_id: @available_interpreter.interpreter_id, job_booking_id: @available_interpreter.job_booking_id } }
    end

    assert_redirected_to available_interpreter_url(AvailableInterpreter.last)
  end

  test "should show available_interpreter" do
    get available_interpreter_url(@available_interpreter)
    assert_response :success
  end

  test "should get edit" do
    get edit_available_interpreter_url(@available_interpreter)
    assert_response :success
  end

  test "should update available_interpreter" do
    patch available_interpreter_url(@available_interpreter), params: { available_interpreter: { interpreter_id: @available_interpreter.interpreter_id, job_booking_id: @available_interpreter.job_booking_id } }
    assert_redirected_to available_interpreter_url(@available_interpreter)
  end

  test "should destroy available_interpreter" do
    assert_difference('AvailableInterpreter.count', -1) do
      delete available_interpreter_url(@available_interpreter)
    end

    assert_redirected_to available_interpreters_url
  end
end
