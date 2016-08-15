class Paciente < ActiveRecord::Base
	has_one :persona, as: :numero, dependent: :destroy
	has_many :direccions, as: :numero, dependent: :destroy		
	belongs_to :ep, :foreign_key => "eps_id"

	before_destroy :destroy_citas, :destroy_encuesta

	accepts_nested_attributes_for :persona, reject_if: proc{ |attr| attr['primer_nombre'].blank? && attr['primer_apellido'].blank? }
	accepts_nested_attributes_for :direccions, reject_if: proc{ |attr| attr['direccion'].blank?}, allow_destroy: true   

	validates :numero_id, :eps_id, :persona, presence: true
	validates :numero_id, uniqueness: true


	def self.search(params={})	
		personaid=" "	
		if !(params[:s_identificacion] == "" && params[:s_pnombre] == "" && params[:s_snombre] == "" && params[:s_papellido] == "" && params[:s_sapellido] == "")
			if (Persona.exists?(["primer_nombre LIKE ? AND segundo_nombre LIKE ? AND primer_apellido LIKE ? AND segundo_apellido LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_pnombre]}%", "%#{params[:s_snombre]}%", "%#{params[:s_papellido]}%", "%#{params[:s_sapellido]}%", "%#{params[:s_identificacion]}%"]))
				personaid=Persona.where(["primer_nombre LIKE ? AND segundo_nombre LIKE ? AND primer_apellido LIKE ? AND segundo_apellido LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_pnombre]}%", "%#{params[:s_snombre]}%", "%#{params[:s_papellido]}%", "%#{params[:s_sapellido]}%", "%#{params[:s_identificacion]}%"]).select(:numero_id).first.numero_id		
			end
		end
		where("numero_id LIKE ? ", "%#{personaid}%")
	end

	private

	def destroy_citas
     	Citum.where(:paciente_id => self.numero_id ).destroy_all  
   	end

   	def destroy_encuesta
   		Encuestaseno.where(:paciente_id => self.numero_id ).destroy_all 
   	end
end

