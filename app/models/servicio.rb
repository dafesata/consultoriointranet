class Servicio < ActiveRecord::Base
	has_many :especialidads
	has_many :profesionals, through: :especialidads		
	has_many :citas, dependent: :destroy

	def especialidads
		Especialidad.where(servicio_id: id,enable:1)
	end
end
