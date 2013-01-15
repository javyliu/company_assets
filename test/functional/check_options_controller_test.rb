require 'test_helper'

class CheckOptionsControllerTest < ActionController::TestCase
  setup do
    @check_option = check_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_option" do
    assert_difference('CheckOption.count') do
      post :create, :check_option => { :item_name => @check_option.item_name }
    end

    assert_redirected_to check_option_path(assigns(:check_option))
  end

  test "should show check_option" do
    get :show, :id => @check_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @check_option
    assert_response :success
  end

  test "should update check_option" do
    put :update, :id => @check_option, :check_option => { :item_name => @check_option.item_name }
    assert_redirected_to check_option_path(assigns(:check_option))
  end

  test "should destroy check_option" do
    assert_difference('CheckOption.count', -1) do
      delete :destroy, :id => @check_option
    end

    assert_redirected_to check_options_path
  end
end
