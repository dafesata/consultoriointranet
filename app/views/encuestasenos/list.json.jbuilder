json.array!(@encuestasenos) do |encuestaseno|
  json.extract! encuestaseno, :id, :paciente_id, :ant_fam, :menarquia, :hijos, :edadphijo, :lactancia, :ant_orales, :menopausia, :edad_menopausia, :trh, :alcohol, :fumador, :consumo_grasa, :peso, :talla, :imc, :equivalente, :nro_mamografias, :autoexamen, :exam_anual, :fecha_mamo, :resul_mamo, :desc_resul
  json.url encuestaseno_url(encuestaseno, format: :json)
end
