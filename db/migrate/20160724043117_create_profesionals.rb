class CreateProfesionals < ActiveRecord::Migration[5.0]
  def change
    create_table :profesionals, id: false do |t|
      t.integer :numero_id
      t.integer :reg_med
      t.integer :especialidad_id

      t.timestamps
    end
    execute "ALTER TABLE profesionals ADD PRIMARY KEY (numero_id);"
  end
end
