require 'test_helper'

class EspecialidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @especialidad = especialidads(:one)
  end

  test "should get index" do
    get especialidads_url
    assert_response :success
  end

  test "should get new" do
    get new_especialidad_url
    assert_response :success
  end

  test "should create especialidad" do
    assert_difference('Especialidad.count') do
      post especialidads_url, params: { especialidad: { enable: @especialidad.enable, especialidad_id: @especialidad.especialidad_id, nombre: @especialidad.nombre, servicio_id: @especialidad.servicio_id } }
    end

    assert_redirected_to especialidad_url(Especialidad.last)
  end

  test "should show especialidad" do
    get especialidad_url(@especialidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_especialidad_url(@especialidad)
    assert_response :success
  end

  test "should update especialidad" do
    patch especialidad_url(@especialidad), params: { especialidad: { enable: @especialidad.enable, especialidad_id: @especialidad.especialidad_id, nombre: @especialidad.nombre, servicio_id: @especialidad.servicio_id } }
    assert_redirected_to especialidad_url(@especialidad)
  end

  test "should destroy especialidad" do
    assert_difference('Especialidad.count', -1) do
      delete especialidad_url(@especialidad)
    end

    assert_redirected_to especialidads_url
  end
end
