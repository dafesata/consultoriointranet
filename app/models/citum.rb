class Citum < ActiveRecord::Base	
	
	belongs_to :servicio, :foreign_key => "servicio_id"
	belongs_to :consultorio, :foreign_key => "consultorio_id"
	belongs_to :especialidad, :foreign_key => "especialidad_id"


	validates :fecha, uniqueness: { scope: [:hora ,:consultorio_id] }	
	validates :nro_autorizacion, uniqueness: true
	validates :paciente_id, :consultorio_id,:servicio_id,:especialidad_id,:profesional_id,:nro_autorizacion, presence: true
	validate :paciente_id_exist

	def paciente_id_exist		
		 return errors.add(:paciente_id, 'debe existir') if (!Paciente.exists?(self.paciente_id))
	end
	


	def self.search(params={})	
		busq=" "	
		if params[:s_tipo]=="1"
			if !(params[:s_nombre] == "" && params[:s_apellido] == "" && params[:s_identificacion] == "")
				if (Persona.exists?(["nombres LIKE ? AND apellidos LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_nombre]}%", "%#{params[:s_apellido]}%", "%#{params[:s_identificacion]}%"]))
					personaid=Persona.where(["nombres LIKE ? AND apellidos LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_nombre]}%", "%#{params[:s_apellido]}%", "%#{params[:s_identificacion]}%"]).select(:numero_id).first.numero_id
					busq=Paciente.where("numero_id LIKE ? ", "%#{personaid}%").select(:numero_id).first.numero_id
					begin
						date=Date.parse(params[:s_fecha].to_a.sort.collect{|c| c[1]}.join("-"))
						where(["paciente_id LIKE ? AND fecha = ?","%#{busq}%","#{date}"])						
					rescue ArgumentError
						where(["paciente_id LIKE ?","%#{busq}%"])						
					end	
				else					
					where(["paciente_id LIKE ?","%#{busq}%"])					
				end
			else

				where(["paciente_id LIKE ?","%#{busq}%"])	
			end
		else
			if params[:s_tipo]=="2"
				if !(params[:s_nombre] == "" && params[:s_apellido] == "" && params[:s_identificacion] == "")
					if (Persona.exists?(["nombres LIKE ? AND apellidos LIKE ? AND numero_id LIKE ? AND numero_type ='Profesional'", "%#{params[:s_nombre]}%", "%#{params[:s_apellido]}%", "%#{params[:s_identificacion]}%"]))
						personaid=Persona.where(["nombres LIKE ? AND apellidos LIKE ? AND numero_id LIKE ? AND numero_type ='Profesional'", "%#{params[:s_nombre]}%", "%#{params[:s_apellido]}%", "%#{params[:s_identificacion]}%"]).select(:numero_id).first.numero_id
						busq=Profesional.where("numero_id LIKE ? ", "%#{personaid}%").select(:numero_id).first.numero_id
						begin
							date=Date.parse(params[:s_fecha].to_a.sort.collect{|c| c[1]}.join("-"))
							where(["profesional_id LIKE ? AND fecha = ?","%#{busq}%","#{date}"])						
						rescue ArgumentError
							where(["profesional_id LIKE ?","%#{busq}%"])						
						end
					else
						where(["profesional_id LIKE ?","%#{busq}%"])
					end
				else
					where(["profesional_id LIKE ?","%#{busq}%"])	
				end
			else				
				if params[:s_tipo]=="3"					
					if !(params[:s_especialidad] == "")
						if (Especialidad.exists?(["nombre LIKE ? AND enable = 1","%#{params[:s_especialidad]}%"]))						
							busq=Especialidad.where(["nombre LIKE ? AND enable = 1","%#{params[:s_especialidad]}%"]).select(:especialidad_id).first.especialidad_id
							begin
								date=Date.parse(params[:s_fecha].to_a.sort.collect{|c| c[1]}.join("-"))
								where(["especialidad_id LIKE ? AND fecha = ?","%#{busq}%","#{date}"])	
							rescue ArgumentError
								where(["especialidad_id LIKE ?","%#{busq}%"])	
							end
						else
							where(["especialidad_id LIKE ?","%#{busq}%"])	
						end	
					else
						where(["especialidad_id LIKE ?","%#{busq}%"])	
					end									
				else
					begin
						date=Date.parse(params[:s_fecha].to_a.sort.collect{|c| c[1]}.join("-"))
						where(:fecha => date)
					rescue ArgumentError
						where(["paciente_id LIKE ?","%#{busq}%"])
					end					
				end
			end
		end					
  	end	
end
