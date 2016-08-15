class CreateDireccions < ActiveRecord::Migration[5.0]
  def change
    create_table :direccions do |t|
      t.string :barrio
      t.string :direccion
      t.integer :tel, limit: 8
      t.references :numero, polymorphic: true
      t.integer :municipio_id

      t.timestamps
    end
  end
end
