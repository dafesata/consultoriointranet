class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.boolean :enable

      t.timestamps
    end
  end
end
