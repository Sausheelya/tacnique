require "test_helper"

class PublicQuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_quizzes_index_url
    assert_response :success
  end

  test "should get take" do
    get public_quizzes_take_url
    assert_response :success
  end

  test "should get submit" do
    get public_quizzes_submit_url
    assert_response :success
  end

  test "should get results" do
    get public_quizzes_results_url
    assert_response :success
  end
end
