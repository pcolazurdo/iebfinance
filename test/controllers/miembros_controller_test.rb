require 'test_helper'

class MiembrosControllerTest < ActionController::TestCase
  setup do
    @miembro = miembros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miembros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miembro" do
    assert_difference('Miembro.count') do
      post :create, miembro: { direccion: @miembro.direccion, email: @miembro.email, estado: @miembro.estado, idFiscal: @miembro.idFiscal, nombre: @miembro.nombre, tipo: @miembro.tipo }
    end

    assert_redirected_to miembro_path(assigns(:miembro))
  end

  test "should show miembro" do
    get :show, id: @miembro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miembro
    assert_response :success
  end

  test "should update miembro" do
    patch :update, id: @miembro, miembro: { direccion: @miembro.direccion, email: @miembro.email, estado: @miembro.estado, idFiscal: @miembro.idFiscal, nombre: @miembro.nombre, tipo: @miembro.tipo }
    assert_redirected_to miembro_path(assigns(:miembro))
  end

  test "should destroy miembro" do
    assert_difference('Miembro.count', -1) do
      delete :destroy, id: @miembro
    end

    assert_redirected_to miembros_path
  end
end
