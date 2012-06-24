require 'test_helper'

class SumbarContentsControllerTest < ActionController::TestCase
  setup do
    @sumbar_content = sumbar_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sumbar_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sumbar_content" do
    assert_difference('SumbarContent.count') do
      post :create, sumbar_content: { content: @sumbar_content.content, title: @sumbar_content.title, type: @sumbar_content.type, user_id: @sumbar_content.user_id }
    end

    assert_redirected_to sumbar_content_path(assigns(:sumbar_content))
  end

  test "should show sumbar_content" do
    get :show, id: @sumbar_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sumbar_content
    assert_response :success
  end

  test "should update sumbar_content" do
    put :update, id: @sumbar_content, sumbar_content: { content: @sumbar_content.content, title: @sumbar_content.title, type: @sumbar_content.type, user_id: @sumbar_content.user_id }
    assert_redirected_to sumbar_content_path(assigns(:sumbar_content))
  end

  test "should destroy sumbar_content" do
    assert_difference('SumbarContent.count', -1) do
      delete :destroy, id: @sumbar_content
    end

    assert_redirected_to sumbar_contents_path
  end
end
