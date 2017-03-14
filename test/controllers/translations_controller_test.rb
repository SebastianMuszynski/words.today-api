require 'test_helper'

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translation = translations(:one)
  end

  test "should get index" do
    get translations_url, as: :json
    assert_response :success
  end

  test "should create translation" do
    assert_difference('Translation.count') do
      post translations_url, params: { translation: { name: @translation.name, word_id: @translation.word_id } }, as: :json
    end

    assert_response 201
  end

  test "should show translation" do
    get translation_url(@translation), as: :json
    assert_response :success
  end

  test "should update translation" do
    patch translation_url(@translation), params: { translation: { name: @translation.name, word_id: @translation.word_id } }, as: :json
    assert_response 200
  end

  test "should destroy translation" do
    assert_difference('Translation.count', -1) do
      delete translation_url(@translation), as: :json
    end

    assert_response 204
  end
end
