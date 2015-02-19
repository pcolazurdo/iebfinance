require 'test_helper'

class MovimientosControllerTest < ActionController::TestCase
  setup do
    @movimiento = movimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento" do
    assert_difference('Movimiento.count') do
      post :create, movimiento: { Comprobante: @movimiento.Comprobante, EgresoDolares: @movimiento.EgresoDolares, EgresoPesos: @movimiento.EgresoPesos, IngresoDolares: @movimiento.IngresoDolares, IngresoPesos: @movimiento.IngresoPesos, comentario: @movimiento.comentario, fecha: @movimiento.fecha }
    end

    assert_redirected_to movimiento_path(assigns(:movimiento))
  end

  test "should show movimiento" do
    get :show, id: @movimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento
    assert_response :success
  end

  test "should update movimiento" do
    patch :update, id: @movimiento, movimiento: { Comprobante: @movimiento.Comprobante, EgresoDolares: @movimiento.EgresoDolares, EgresoPesos: @movimiento.EgresoPesos, IngresoDolares: @movimiento.IngresoDolares, IngresoPesos: @movimiento.IngresoPesos, comentario: @movimiento.comentario, fecha: @movimiento.fecha }
    assert_redirected_to movimiento_path(assigns(:movimiento))
  end

  test "should destroy movimiento" do
    assert_difference('Movimiento.count', -1) do
      delete :destroy, id: @movimiento
    end

    assert_redirected_to movimientos_path
  end
end
