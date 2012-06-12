require 'test_helper'

class TipsTricksControllerTest < ActionController::TestCase
  setup do
    @tips_trick = tips_tricks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tips_tricks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tips_trick" do
    assert_difference('TipsTrick.count') do
      post :create, tips_trick: { description: @tips_trick.description, title: @tips_trick.title, user_id: @tips_trick.user_id }
    end

    assert_redirected_to tips_trick_path(assigns(:tips_trick))
  end

  test "should show tips_trick" do
    get :show, id: @tips_trick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tips_trick
    assert_response :success
  end

  test "should update tips_trick" do
    put :update, id: @tips_trick, tips_trick: { description: @tips_trick.description, title: @tips_trick.title, user_id: @tips_trick.user_id }
    assert_redirected_to tips_trick_path(assigns(:tips_trick))
  end

  test "should destroy tips_trick" do
    assert_difference('TipsTrick.count', -1) do
      delete :destroy, id: @tips_trick
    end

    assert_redirected_to tips_tricks_path
  end
end
