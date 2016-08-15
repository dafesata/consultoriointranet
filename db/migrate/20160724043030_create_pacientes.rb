class CreatePacientes < ActiveRecord::Migration[5.0]
  def change
    create_table :pacientes, id: false do |t|
      t.integer :numero_id
      t.string :eps_id
      t.string :tipo_usuario

      t.timestamps
    end
    execute "ALTER TABLE pacientes ADD PRIMARY KEY (numero_id);"
  end
end
