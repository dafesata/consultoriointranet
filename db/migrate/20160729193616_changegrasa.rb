class Changegrasa < ActiveRecord::Migration[5.0]
  def change
  	remove_column :encuestasenos, :consumo_grasa_boolean
  	add_column :encuestasenos, :consumo_grasa, :boolean
  end
end
