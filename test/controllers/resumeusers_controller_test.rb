require 'test_helper'

class ResumeusersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get resumeusers_new_url
    assert_response :success
  end

  test "should get index" do
    get resumeusers_index_url
    assert_response :success
  end

  test "should get show" do
    get resumeusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get resumeusers_edit_url
    assert_response :success
  end

end
