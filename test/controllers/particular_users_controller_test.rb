require "test_helper"

class ParticularUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get particular_users_index_url
    assert_response :success
  end

  test "should get new" do
    get particular_users_new_url
    assert_response :success
  end

  test "should get create" do
    get particular_users_create_url
    assert_response :success
  end

  test "should get update" do
    get particular_users_update_url
    assert_response :success
  end

  test "should get show" do
    get particular_users_show_url
    assert_response :success
  end

  test "should get delete" do
    get particular_users_delete_url
    assert_response :success
  end
end
