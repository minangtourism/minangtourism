require 'test_helper'

class WhereToStaysControllerTest < ActionController::TestCase
  setup do
    @where_to_stay = where_to_stays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_to_stays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_to_stay" do
    assert_difference('WhereToStay.count') do
      post :create, where_to_stay: {  }
    end

    assert_redirected_to where_to_stay_path(assigns(:where_to_stay))
  end

  test "should show where_to_stay" do
    get :show, id: @where_to_stay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @where_to_stay
    assert_response :success
  end

  test "should update where_to_stay" do
    put :update, id: @where_to_stay, where_to_stay: {  }
    assert_redirected_to where_to_stay_path(assigns(:where_to_stay))
  end

  test "should destroy where_to_stay" do
    assert_difference('WhereToStay.count', -1) do
      delete :destroy, id: @where_to_stay
    end

    assert_redirected_to where_to_stays_path
  end
end
