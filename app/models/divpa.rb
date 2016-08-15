class Divpa < ActiveRecord::Base
	has_many :direccions

	def self.search(params={})
    busq=3
  		if (params[:s_municipio] == "" && params[:s_departamento] == "")
  			where("enable LIKE ?","%#{busq}%") 
      else
  			where("nombre_dpto LIKE ? AND nombre_cp LIKE ?", "%#{params[:s_departamento]}%", "%#{params[:s_municipio]}%")  		
  			
  		end
	end
	
end
