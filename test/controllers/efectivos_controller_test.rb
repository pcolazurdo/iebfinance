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
      post :create, efectivo: { Dolares100: @efectivo.Dolares100, Dolares10: @efectivo.Dolares10, Dolares1: @efectivo.Dolares1, Dolares20: @efectivo.Dolares20, Dolares2: @efectivo.Dolares2, Dolares50: @efectivo.Dolares50, Dolares5: @efectivo.Dolares5, DolaresMonedas: @efectivo.DolaresMonedas, Pesos100: @efectivo.Pesos100, Pesos10: @efectivo.Pesos10, Pesos20: @efectivo.Pesos20, Pesos2: @efectivo.Pesos2, Pesos50: @efectivo.Pesos50, Pesos5: @efectivo.Pesos5, PesosMonedas: @efectivo.PesosMonedas, fecha: @efectivo.fecha }
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
    patch :update, id: @efectivo, efectivo: { Dolares100: @efectivo.Dolares100, Dolares10: @efectivo.Dolares10, Dolares1: @efectivo.Dolares1, Dolares20: @efectivo.Dolares20, Dolares2: @efectivo.Dolares2, Dolares50: @efectivo.Dolares50, Dolares5: @efectivo.Dolares5, DolaresMonedas: @efectivo.DolaresMonedas, Pesos100: @efectivo.Pesos100, Pesos10: @efectivo.Pesos10, Pesos20: @efectivo.Pesos20, Pesos2: @efectivo.Pesos2, Pesos50: @efectivo.Pesos50, Pesos5: @efectivo.Pesos5, PesosMonedas: @efectivo.PesosMonedas, fecha: @efectivo.fecha }
    assert_redirected_to efectivo_path(assigns(:efectivo))
  end

  test "should destroy efectivo" do
    assert_difference('Efectivo.count', -1) do
      delete :destroy, id: @efectivo
    end

    assert_redirected_to efectivos_path
  end
end
