class CreateEncuestasenos < ActiveRecord::Migration[5.0]
  def change
    create_table :encuestasenos, id:false do |t|
      t.integer :paciente_id
      t.boolean :ant_fam
      t.integer :menarquia
      t.boolean :hijos
      t.integer :edadphijo
      t.boolean :lactancia
      t.boolean :ant_orales
      t.boolean :menopausia
      t.integer :edad_menopausia
      t.boolean :trh
      t.boolean :alcohol
      t.boolean :fumador
      t.string :consumo_grasa_boolean
      t.decimal :peso
      t.decimal :talla
      t.decimal :imc
      t.string :equivalente
      t.integer :nro_mamografias
      t.boolean :autoexamen
      t.boolean :exam_anual
      t.date :fecha_mamo
      t.integer :resul_mamo
      t.string :desc_resul

      t.timestamps
    end
    execute "ALTER TABLE encuestasenos ADD PRIMARY KEY (paciente_id);"
    execute "ALTER TABLE encuestasenos ADD FOREIGN KEY(paciente_id) REFERENCES pacientes(numero_id);"
  end
end
