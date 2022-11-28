require "test_helper"

class SalariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salaries_index_url
    assert_response :success
  end

  test "should get new" do
    get salaries_new_url
    assert_response :success
  end

  test "should get create" do
    get salaries_create_url
    assert_response :success
  end

  test "should get update" do
    get salaries_update_url
    assert_response :success
  end

  test "should get show" do
    get salaries_show_url
    assert_response :success
  end

  test "should get delete" do
    get salaries_delete_url
    assert_response :success
  end
end
