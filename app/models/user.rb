class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:username]

         
   validates :username,:presence => true,:uniqueness => {:case_sensitive => false} # etc.
   validate :validate_username 

   
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end 

  def admin?
    self.tipo=="ADMINISTRADOR"
  end

  def basic?
    self.tipo=="BASICO"
  end

  def prof?
    self.tipo=="PROFESIONAL"
  end

end
