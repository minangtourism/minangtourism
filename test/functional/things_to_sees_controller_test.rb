require 'test_helper'

class ThingsToSeesControllerTest < ActionController::TestCase
  setup do
    @things_to_see = things_to_sees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:things_to_sees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create things_to_see" do
    assert_difference('ThingsToSee.count') do
      post :create, things_to_see: {  }
    end

    assert_redirected_to things_to_see_path(assigns(:things_to_see))
  end

  test "should show things_to_see" do
    get :show, id: @things_to_see
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @things_to_see
    assert_response :success
  end

  test "should update things_to_see" do
    put :update, id: @things_to_see, things_to_see: {  }
    assert_redirected_to things_to_see_path(assigns(:things_to_see))
  end

  test "should destroy things_to_see" do
    assert_difference('ThingsToSee.count', -1) do
      delete :destroy, id: @things_to_see
    end

    assert_redirected_to things_to_sees_path
  end
end
