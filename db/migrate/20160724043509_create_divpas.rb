class CreateDivpas < ActiveRecord::Migration[5.0]
  def change
    create_table :divpas, id: false do |t|
      t.integer :cod_dpto
      t.integer :cod_muni
      t.integer :cod_cp
      t.string :nombre_dpto
      t.string :nombre_muni
      t.string :nombre_cp
      t.string :tipo
      t.boolean :enable

      t.timestamps
    end
    execute "ALTER TABLE divpas ADD PRIMARY KEY (cod_cp);"

  end
end
