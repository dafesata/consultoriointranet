class Addfields < ActiveRecord::Migration[5.0]
  def change
  	add_column :cita, :nro_autorizacion, :string
  	add_column :cita, :primera_vez, :boolean  	
  	add_index :cita, :nro_autorizacion, unique: true

  	
  end
end
