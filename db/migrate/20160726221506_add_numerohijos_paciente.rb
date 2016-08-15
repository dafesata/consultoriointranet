class AddNumerohijosPaciente < ActiveRecord::Migration[5.0]
  def change
  	add_column :pacientes, :nro_hijos, :integer
  end
end
