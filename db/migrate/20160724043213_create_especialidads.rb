class CreateEspecialidads < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidads, id: false do |t|
      t.integer :especialidad_id
      t.string :nombre
      t.integer :servicio_id
      t.boolean :enable

      t.timestamps
    end
    execute "ALTER TABLE especialidads ADD PRIMARY KEY (especialidad_id);"
  end
end
