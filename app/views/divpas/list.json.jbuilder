json.array!(@divpas) do |divpa|
  json.extract! divpa, :id, :cod_dpto, :cod_muni, :cod_cp, :nombre_dpto, :nombre_muni, :nombre_cp, :tipo, :enable
  json.url divpa_url(divpa, format: :json)
end
