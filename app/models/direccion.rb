class Direccion < ActiveRecord::Base
	belongs_to :numero, polymorphic: true, required: false	 
	belongs_to :divpa,	:foreign_key => "municipio_id"
	validates :direccion, presence: true	

	def to_s
		direccion
	end
end
