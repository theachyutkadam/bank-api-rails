require "test_helper"

class SalaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salary_index_url
    assert_response :success
  end

  test "should get new" do
    get salary_new_url
    assert_response :success
  end

  test "should get create" do
    get salary_create_url
    assert_response :success
  end

  test "should get update" do
    get salary_update_url
    assert_response :success
  end

  test "should get show" do
    get salary_show_url
    assert_response :success
  end

  test "should get delete" do
    get salary_delete_url
    assert_response :success
  end
end
