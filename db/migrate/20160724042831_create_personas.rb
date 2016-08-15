class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :tipoid
      t.references :numero, polymorphic: true
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :estado_civil
      t.date :fecha_nac
      t.string :sexo
      t.integer :celular, limit: 8

      t.timestamps
    end
  end
end
