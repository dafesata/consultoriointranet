json.eps {
json.array!(@eps) do |ep|
  json.extract! ep, :id, :codigo_eps, :nombre, :enable  
  json.query params[:query]
end
} 
