class CreateConsultorios < ActiveRecord::Migration[5.0]
  def change
    create_table :consultorios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
