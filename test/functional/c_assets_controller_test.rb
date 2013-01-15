require 'test_helper'

class CAssetsControllerTest < ActionController::TestCase
  setup do
    @c_asset = c_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_asset" do
    assert_difference('CAsset.count') do
      post :create, :c_asset => { :asset_category_id => @c_asset.asset_category_id, :bianhao => @c_asset.bianhao, :last_update_user => @c_asset.last_update_user }
    end

    assert_redirected_to c_asset_path(assigns(:c_asset))
  end

  test "should show c_asset" do
    get :show, :id => @c_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @c_asset
    assert_response :success
  end

  test "should update c_asset" do
    put :update, :id => @c_asset, :c_asset => { :asset_category_id => @c_asset.asset_category_id, :bianhao => @c_asset.bianhao, :last_update_user => @c_asset.last_update_user }
    assert_redirected_to c_asset_path(assigns(:c_asset))
  end

  test "should destroy c_asset" do
    assert_difference('CAsset.count', -1) do
      delete :destroy, :id => @c_asset
    end

    assert_redirected_to c_assets_path
  end
end
