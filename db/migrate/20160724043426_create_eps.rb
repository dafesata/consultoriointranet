class CreateEps < ActiveRecord::Migration[5.0]
  def change
    create_table :eps, id: false do |t|
      t.string :codigo_eps
      t.string :nombre
      t.boolean :enable

      t.timestamps
    end
    add_index :eps, :codigo_eps, unique: true
    execute "ALTER TABLE eps ADD PRIMARY KEY (codigo_eps);"	
  end
end
