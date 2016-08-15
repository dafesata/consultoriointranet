class Ep < ActiveRecord::Base
	has_many :pacientes


	def self.search(params={})
		busq=3
  		if !(params[:s_eps] == "")
  			where("nombre LIKE ? ", "%#{params[:s_eps]}%")  		
  		else
  			where("enable LIKE ? ","%#{busq}%")  		
  		end
	end
end
