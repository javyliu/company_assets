require 'test_helper'

class CategoryPropertiesControllerTest < ActionController::TestCase
  setup do
    @category_property = category_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_property" do
    assert_difference('CategoryProperty.count') do
      post :create, :category_property => {  }
    end

    assert_redirected_to category_property_path(assigns(:category_property))
  end

  test "should show category_property" do
    get :show, :id => @category_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @category_property
    assert_response :success
  end

  test "should update category_property" do
    put :update, :id => @category_property, :category_property => {  }
    assert_redirected_to category_property_path(assigns(:category_property))
  end

  test "should destroy category_property" do
    assert_difference('CategoryProperty.count', -1) do
      delete :destroy, :id => @category_property
    end

    assert_redirected_to category_properties_path
  end
end
