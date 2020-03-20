require 'test_helper'

class FieldchoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fieldchoices_index_url
    assert_response :success
  end

  test "should get show" do
    get fieldchoices_show_url
    assert_response :success
  end

  test "should get edit" do
    get fieldchoices_edit_url
    assert_response :success
  end

  test "should get new" do
    get fieldchoices_new_url
    assert_response :success
  end

end
