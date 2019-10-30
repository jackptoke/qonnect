require 'test_helper'

class InterpreterLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interpreter_language = interpreter_languages(:one)
  end

  test "should get index" do
    get interpreter_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_interpreter_language_url
    assert_response :success
  end

  test "should create interpreter_language" do
    assert_difference('InterpreterLanguage.count') do
      post interpreter_languages_url, params: { interpreter_language: { interpreter_id: @interpreter_language.interpreter_id, language_id: @interpreter_language.language_id } }
    end

    assert_redirected_to interpreter_language_url(InterpreterLanguage.last)
  end

  test "should show interpreter_language" do
    get interpreter_language_url(@interpreter_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_interpreter_language_url(@interpreter_language)
    assert_response :success
  end

  test "should update interpreter_language" do
    patch interpreter_language_url(@interpreter_language), params: { interpreter_language: { interpreter_id: @interpreter_language.interpreter_id, language_id: @interpreter_language.language_id } }
    assert_redirected_to interpreter_language_url(@interpreter_language)
  end

  test "should destroy interpreter_language" do
    assert_difference('InterpreterLanguage.count', -1) do
      delete interpreter_language_url(@interpreter_language)
    end

    assert_redirected_to interpreter_languages_url
  end
end
