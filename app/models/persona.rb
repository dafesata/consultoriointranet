class Persona < ActiveRecord::Base
  belongs_to :numero, polymorphic: true, required: false  
  validates :numero_id, :primer_nombre, :primer_apellido, presence: true    
  before_create :fecha_nac, :timeliness => {:on_or_before => lambda { Date.current }}    
  accepts_nested_attributes_for :numero

  before_create :Nombres_Apellidos
  before_save   :Nombres_Apellidos

  def to_s
  		primer_nombre+" "+segundo_nombre+" "+primer_apellido+" "+segundo_apellido
   end

   def nombres
    primer_nombre+" "+segundo_nombre
   end

   def apellidos
    primer_apellido+" "+segundo_apellido
   end

   def Nombres_Apellidos    
     self.primer_nombre=self.primer_nombre.titleize
     self.segundo_nombre=self.segundo_nombre.titleize
     self.primer_apellido=self.primer_apellido.titleize
     self.segundo_apellido=self.segundo_apellido.titleize
   end

def numero_attributes=(attributes)
    if NUMERO.include?(numero_type.underscore.to_sym)
      self.numero ||= self.numero.constantize.new
      self.numeri.assign_attributes(attributes)
    end
  end

  
end
