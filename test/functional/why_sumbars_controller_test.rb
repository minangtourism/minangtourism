require 'test_helper'

class WhySumbarsControllerTest < ActionController::TestCase
  setup do
    @why_sumbar = why_sumbars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:why_sumbars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create why_sumbar" do
    assert_difference('WhySumbar.count') do
      post :create, why_sumbar: { description: @why_sumbar.description, title: @why_sumbar.title, user_id: @why_sumbar.user_id }
    end

    assert_redirected_to why_sumbar_path(assigns(:why_sumbar))
  end

  test "should show why_sumbar" do
    get :show, id: @why_sumbar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @why_sumbar
    assert_response :success
  end

  test "should update why_sumbar" do
    put :update, id: @why_sumbar, why_sumbar: { description: @why_sumbar.description, title: @why_sumbar.title, user_id: @why_sumbar.user_id }
    assert_redirected_to why_sumbar_path(assigns(:why_sumbar))
  end

  test "should destroy why_sumbar" do
    assert_difference('WhySumbar.count', -1) do
      delete :destroy, id: @why_sumbar
    end

    assert_redirected_to why_sumbars_path
  end
end
