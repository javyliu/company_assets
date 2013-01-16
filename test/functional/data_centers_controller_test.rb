require 'test_helper'

class DataCentersControllerTest < ActionController::TestCase
  setup do
    @data_center = data_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_center" do
    assert_difference('DataCenter.count') do
      post :create, :data_center => { :bandwidth => @data_center.bandwidth, :contract_no => @data_center.contract_no, :device_no => @data_center.device_no, :ems_address => @data_center.ems_address, :exchange_device => @data_center.exchange_device, :fee => @data_center.fee, :ip => @data_center.ip, :kefu_tel => @data_center.kefu_tel, :map => @data_center.map, :name => @data_center.name, :other_contact => @data_center.other_contact, :port_num => @data_center.port_num, :remark => @data_center.remark, :space => @data_center.space }
    end

    assert_redirected_to data_center_path(assigns(:data_center))
  end

  test "should show data_center" do
    get :show, :id => @data_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @data_center
    assert_response :success
  end

  test "should update data_center" do
    put :update, :id => @data_center, :data_center => { :bandwidth => @data_center.bandwidth, :contract_no => @data_center.contract_no, :device_no => @data_center.device_no, :ems_address => @data_center.ems_address, :exchange_device => @data_center.exchange_device, :fee => @data_center.fee, :ip => @data_center.ip, :kefu_tel => @data_center.kefu_tel, :map => @data_center.map, :name => @data_center.name, :other_contact => @data_center.other_contact, :port_num => @data_center.port_num, :remark => @data_center.remark, :space => @data_center.space }
    assert_redirected_to data_center_path(assigns(:data_center))
  end

  test "should destroy data_center" do
    assert_difference('DataCenter.count', -1) do
      delete :destroy, :id => @data_center
    end

    assert_redirected_to data_centers_path
  end
end
