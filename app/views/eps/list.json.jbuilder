json.array!(@eps) do |ep|
  json.extract! ep, :id, :codigo_eps, :nombre, :enable
  json.url ep_url(ep, format: :json)
end
