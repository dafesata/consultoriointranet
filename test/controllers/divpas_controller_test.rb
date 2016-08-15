require 'test_helper'

class DivpasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @divpa = divpas(:one)
  end

  test "should get index" do
    get divpas_url
    assert_response :success
  end

  test "should get new" do
    get new_divpa_url
    assert_response :success
  end

  test "should create divpa" do
    assert_difference('Divpa.count') do
      post divpas_url, params: { divpa: { cod_cp: @divpa.cod_cp, cod_dpto: @divpa.cod_dpto, cod_muni: @divpa.cod_muni, enable: @divpa.enable, nombre_cp: @divpa.nombre_cp, nombre_dpto: @divpa.nombre_dpto, nombre_muni: @divpa.nombre_muni, tipo: @divpa.tipo } }
    end

    assert_redirected_to divpa_url(Divpa.last)
  end

  test "should show divpa" do
    get divpa_url(@divpa)
    assert_response :success
  end

  test "should get edit" do
    get edit_divpa_url(@divpa)
    assert_response :success
  end

  test "should update divpa" do
    patch divpa_url(@divpa), params: { divpa: { cod_cp: @divpa.cod_cp, cod_dpto: @divpa.cod_dpto, cod_muni: @divpa.cod_muni, enable: @divpa.enable, nombre_cp: @divpa.nombre_cp, nombre_dpto: @divpa.nombre_dpto, nombre_muni: @divpa.nombre_muni, tipo: @divpa.tipo } }
    assert_redirected_to divpa_url(@divpa)
  end

  test "should destroy divpa" do
    assert_difference('Divpa.count', -1) do
      delete divpa_url(@divpa)
    end

    assert_redirected_to divpas_url
  end
end
