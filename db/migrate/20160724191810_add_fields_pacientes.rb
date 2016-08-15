class AddFieldsPacientes < ActiveRecord::Migration[5.0]
  def change
  	add_column :pacientes, :lugar_nac, :string
  	add_column :pacientes, :nacionalidad, :string
  	add_column :pacientes, :escolaridad, :string
  	add_column :pacientes, :ocupacion, :string
  	add_column :pacientes, :estrato, :integer
  	add_column :pacientes, :email, :string
  end
end
