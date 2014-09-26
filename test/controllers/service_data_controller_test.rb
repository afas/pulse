require 'test_helper'

class ServiceDataControllerTest < ActionController::TestCase
  setup do
    @service_datum = service_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_datum" do
    assert_difference('ServiceDatum.count') do
      post :create, service_datum: {  }
    end

    assert_redirected_to service_datum_path(assigns(:service_datum))
  end

  test "should show service_datum" do
    get :show, id: @service_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_datum
    assert_response :success
  end

  test "should update service_datum" do
    patch :update, id: @service_datum, service_datum: {  }
    assert_redirected_to service_datum_path(assigns(:service_datum))
  end

  test "should destroy service_datum" do
    assert_difference('ServiceDatum.count', -1) do
      delete :destroy, id: @service_datum
    end

    assert_redirected_to service_data_path
  end
end
