require 'test_helper'

class EncuestasenosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encuestaseno = encuestasenos(:one)
  end

  test "should get index" do
    get encuestasenos_url
    assert_response :success
  end

  test "should get new" do
    get new_encuestaseno_url
    assert_response :success
  end

  test "should create encuestaseno" do
    assert_difference('Encuestaseno.count') do
      post encuestasenos_url, params: { encuestaseno: { alcohol: @encuestaseno.alcohol, ant_fam: @encuestaseno.ant_fam, ant_orales: @encuestaseno.ant_orales, autoexamen: @encuestaseno.autoexamen, consumo_grasa_boolean: @encuestaseno.consumo_grasa_boolean, desc_resul: @encuestaseno.desc_resul, edad_menopausia: @encuestaseno.edad_menopausia, edadphijo: @encuestaseno.edadphijo, equivalente: @encuestaseno.equivalente, exam_anual: @encuestaseno.exam_anual, fecha_mamo: @encuestaseno.fecha_mamo, fumador: @encuestaseno.fumador, hijos: @encuestaseno.hijos, imc: @encuestaseno.imc, lactancia: @encuestaseno.lactancia, menarquia: @encuestaseno.menarquia, menopausia: @encuestaseno.menopausia, nro_mamografias: @encuestaseno.nro_mamografias, paciente_id: @encuestaseno.paciente_id, peso: @encuestaseno.peso, resul_mamo: @encuestaseno.resul_mamo, talla: @encuestaseno.talla, trh: @encuestaseno.trh } }
    end

    assert_redirected_to encuestaseno_url(Encuestaseno.last)
  end

  test "should show encuestaseno" do
    get encuestaseno_url(@encuestaseno)
    assert_response :success
  end

  test "should get edit" do
    get edit_encuestaseno_url(@encuestaseno)
    assert_response :success
  end

  test "should update encuestaseno" do
    patch encuestaseno_url(@encuestaseno), params: { encuestaseno: { alcohol: @encuestaseno.alcohol, ant_fam: @encuestaseno.ant_fam, ant_orales: @encuestaseno.ant_orales, autoexamen: @encuestaseno.autoexamen, consumo_grasa_boolean: @encuestaseno.consumo_grasa_boolean, desc_resul: @encuestaseno.desc_resul, edad_menopausia: @encuestaseno.edad_menopausia, edadphijo: @encuestaseno.edadphijo, equivalente: @encuestaseno.equivalente, exam_anual: @encuestaseno.exam_anual, fecha_mamo: @encuestaseno.fecha_mamo, fumador: @encuestaseno.fumador, hijos: @encuestaseno.hijos, imc: @encuestaseno.imc, lactancia: @encuestaseno.lactancia, menarquia: @encuestaseno.menarquia, menopausia: @encuestaseno.menopausia, nro_mamografias: @encuestaseno.nro_mamografias, paciente_id: @encuestaseno.paciente_id, peso: @encuestaseno.peso, resul_mamo: @encuestaseno.resul_mamo, talla: @encuestaseno.talla, trh: @encuestaseno.trh } }
    assert_redirected_to encuestaseno_url(@encuestaseno)
  end

  test "should destroy encuestaseno" do
    assert_difference('Encuestaseno.count', -1) do
      delete encuestaseno_url(@encuestaseno)
    end

    assert_redirected_to encuestasenos_url
  end
end
