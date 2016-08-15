require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get personas_url
    assert_response :success
  end

  test "should get new" do
    get new_persona_url
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post personas_url, params: { persona: { celular: @persona.celular, estado_civil: @persona.estado_civil, fecha_nac: @persona.fecha_nac, numero_id: @persona.numero_id, numero_type: @persona.numero_type, primer_apellido: @persona.primer_apellido, primer_nombre: @persona.primer_nombre, segundo_apellido: @persona.segundo_apellido, segundo_nombre: @persona.segundo_nombre, sexo: @persona.sexo, tipoid: @persona.tipoid } }
    end

    assert_redirected_to persona_url(Persona.last)
  end

  test "should show persona" do
    get persona_url(@persona)
    assert_response :success
  end

  test "should get edit" do
    get edit_persona_url(@persona)
    assert_response :success
  end

  test "should update persona" do
    patch persona_url(@persona), params: { persona: { celular: @persona.celular, estado_civil: @persona.estado_civil, fecha_nac: @persona.fecha_nac, numero_id: @persona.numero_id, numero_type: @persona.numero_type, primer_apellido: @persona.primer_apellido, primer_nombre: @persona.primer_nombre, segundo_apellido: @persona.segundo_apellido, segundo_nombre: @persona.segundo_nombre, sexo: @persona.sexo, tipoid: @persona.tipoid } }
    assert_redirected_to persona_url(@persona)
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete persona_url(@persona)
    end

    assert_redirected_to personas_url
  end
end
