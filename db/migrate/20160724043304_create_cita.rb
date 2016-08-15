class CreateCita < ActiveRecord::Migration[5.0]
  def change
    create_table :cita do |t|
      t.integer :paciente_id
      t.date :fecha
      t.time :hora
      t.integer :consultorio_id
      t.integer :servicio_id
      t.integer :especialidad_id
      t.integer :profesional_id
      t.boolean :llegada
      t.boolean :atendido
      t.boolean :riesgo
      t.boolean :psicosocial

      t.timestamps
    end
    add_index :cita, [:fecha,:hora,:consultorio_id], unique: true
  end
end
