require 'test_helper'

class CuentaControllerTest < ActionController::TestCase
  setup do
    @cuentum = cuenta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuenta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuentum" do
    assert_difference('Cuenta.count') do
      post :create, cuentum: { cuenta: @cuentum.cuenta, descripcion: @cuentum.descripcion, estado: @cuentum.estado, nombre: @cuentum.nombre, subcuenta1: @cuentum.subcuenta1, subcuenta2: @cuentum.subcuenta2, subcuenta3: @cuentum.subcuenta3, subcuenta4: @cuentum.subcuenta4, subcuenta5: @cuentum.subcuenta5, tipo: @cuentum.tipo }
    end

    assert_redirected_to cuentum_path(assigns(:cuentum))
  end

  test "should show cuentum" do
    get :show, id: @cuentum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuentum
    assert_response :success
  end

  test "should update cuentum" do
    patch :update, id: @cuentum, cuentum: { cuenta: @cuentum.cuenta, descripcion: @cuentum.descripcion, estado: @cuentum.estado, nombre: @cuentum.nombre, subcuenta1: @cuentum.subcuenta1, subcuenta2: @cuentum.subcuenta2, subcuenta3: @cuentum.subcuenta3, subcuenta4: @cuentum.subcuenta4, subcuenta5: @cuentum.subcuenta5, tipo: @cuentum.tipo }
    assert_redirected_to cuentum_path(assigns(:cuentum))
  end

  test "should destroy cuentum" do
    assert_difference('Cuenta.count', -1) do
      delete :destroy, id: @cuentum
    end

    assert_redirected_to cuenta_index_path
  end
end
