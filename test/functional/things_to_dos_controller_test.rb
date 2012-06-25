require 'test_helper'

class ThingsToDosControllerTest < ActionController::TestCase
  setup do
    @things_to_do = things_to_dos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:things_to_dos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create things_to_do" do
    assert_difference('ThingsToDo.count') do
      post :create, things_to_do: {  }
    end

    assert_redirected_to things_to_do_path(assigns(:things_to_do))
  end

  test "should show things_to_do" do
    get :show, id: @things_to_do
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @things_to_do
    assert_response :success
  end

  test "should update things_to_do" do
    put :update, id: @things_to_do, things_to_do: {  }
    assert_redirected_to things_to_do_path(assigns(:things_to_do))
  end

  test "should destroy things_to_do" do
    assert_difference('ThingsToDo.count', -1) do
      delete :destroy, id: @things_to_do
    end

    assert_redirected_to things_to_dos_path
  end
end
