require "test_helper"

class TransactionUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transaction_users_index_url
    assert_response :success
  end

  test "should get new" do
    get transaction_users_new_url
    assert_response :success
  end

  test "should get create" do
    get transaction_users_create_url
    assert_response :success
  end

  test "should get update" do
    get transaction_users_update_url
    assert_response :success
  end

  test "should get show" do
    get transaction_users_show_url
    assert_response :success
  end

  test "should get delete" do
    get transaction_users_delete_url
    assert_response :success
  end
end
