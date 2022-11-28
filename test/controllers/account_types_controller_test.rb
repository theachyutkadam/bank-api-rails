require "test_helper"

class AccountTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_types_index_url
    assert_response :success
  end

  test "should get new" do
    get account_types_new_url
    assert_response :success
  end

  test "should get create" do
    get account_types_create_url
    assert_response :success
  end

  test "should get update" do
    get account_types_update_url
    assert_response :success
  end

  test "should get show" do
    get account_types_show_url
    assert_response :success
  end

  test "should get delete" do
    get account_types_delete_url
    assert_response :success
  end
end
