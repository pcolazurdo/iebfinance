require 'test_helper'

class EfectivosControllerTest < ActionController::TestCase
  setup do
    @efectivo = efectivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:efectivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create efectivo" do
    assert_difference('Efectivo.count') do
      post :create, efectivo: {  }
    end

    assert_redirected_to efectivo_path(assigns(:efectivo))
  end

  test "should show efectivo" do
    get :show, id: @efectivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @efectivo
    assert_response :success
  end

  test "should update efectivo" do
    patch :update, id: @efectivo, efectivo: {  }
    assert_redirected_to efectivo_path(assigns(:efectivo))
  end

  test "should destroy efectivo" do
    assert_difference('Efectivo.count', -1) do
      delete :destroy, id: @efectivo
    end

    assert_redirected_to efectivos_path
  end
end
