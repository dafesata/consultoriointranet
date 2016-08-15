class Especialidad < ActiveRecord::Base
	belongs_to :servicio, :foreign_key => "servicio_id"
	has_many :profesionals
  has_many :personas, through: :profesionals
	has_many :citas, dependent: :destroy

	def self.search(params={})      
    busq=3  
  	if (params[:s_especialidad] == "" && params[:s_servicio] == "")
  		where("enable LIKE ?","%#{busq}%") 
  	else
      if !(params[:s_especialidad]== "")  
        if !(params[:s_servicio]== "")      
          if (Servicio.exists?(["nombre LIKE ?", "%#{params[:s_servicio]}%"]))
            serv_id=Servicio.where("nombre LIKE ?", "%#{params[:s_servicio]}%").select(:id).first.id
            where("nombre LIKE ? AND servicio_id LIKE ?", "%#{params[:s_especialidad]}%", "%#{serv_id}%") 
          else 
            where("nombre LIKE ? ", "%#{params[:s_especialidad]}%")  
          end 
        else
          where("nombre LIKE ? ", "%#{params[:s_especialidad]}%")  
        end
      else  
        if (Servicio.exists?(["nombre LIKE ?", "%#{params[:s_servicio]}%"]))
          serv_id=Servicio.where("nombre LIKE ?", "%#{params[:s_servicio]}%").select(:id).first.id
          where("servicio_id LIKE ?", "%#{serv_id}%") 
        else          
          where("enable LIKE ?","%#{busq}%")
        end 
      end 
    end
  end

end