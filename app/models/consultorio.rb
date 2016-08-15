class Consultorio < ActiveRecord::Base
	has_many :citas, dependent: :destroy
end
