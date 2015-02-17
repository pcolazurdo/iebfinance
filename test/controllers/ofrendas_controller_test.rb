require 'test_helper'

class OfrendasControllerTest < ActionController::TestCase
  setup do
    @ofrenda = ofrendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ofrendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ofrenda" do
    assert_difference('Ofrenda.count') do
      post :create, ofrenda: { comentario: @ofrenda.comentario, esCheque: @ofrenda.esCheque, fecha: @ofrenda.fecha, idcheque: @ofrenda.idcheque, montoDolares: @ofrenda.montoDolares, montoPesos: @ofrenda.montoPesos }
    end

    assert_redirected_to ofrenda_path(assigns(:ofrenda))
  end

  test "should show ofrenda" do
    get :show, id: @ofrenda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ofrenda
    assert_response :success
  end

  test "should update ofrenda" do
    patch :update, id: @ofrenda, ofrenda: { comentario: @ofrenda.comentario, esCheque: @ofrenda.esCheque, fecha: @ofrenda.fecha, idcheque: @ofrenda.idcheque, montoDolares: @ofrenda.montoDolares, montoPesos: @ofrenda.montoPesos }
    assert_redirected_to ofrenda_path(assigns(:ofrenda))
  end

  test "should destroy ofrenda" do
    assert_difference('Ofrenda.count', -1) do
      delete :destroy, id: @ofrenda
    end

    assert_redirected_to ofrendas_path
  end
end
