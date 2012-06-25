require 'test_helper'

class GettingTheresControllerTest < ActionController::TestCase
  setup do
    @getting_there = getting_theres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:getting_theres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create getting_there" do
    assert_difference('GettingThere.count') do
      post :create, getting_there: {  }
    end

    assert_redirected_to getting_there_path(assigns(:getting_there))
  end

  test "should show getting_there" do
    get :show, id: @getting_there
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @getting_there
    assert_response :success
  end

  test "should update getting_there" do
    put :update, id: @getting_there, getting_there: {  }
    assert_redirected_to getting_there_path(assigns(:getting_there))
  end

  test "should destroy getting_there" do
    assert_difference('GettingThere.count', -1) do
      delete :destroy, id: @getting_there
    end

    assert_redirected_to getting_theres_path
  end
end
