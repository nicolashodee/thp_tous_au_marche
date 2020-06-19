class AddColumnsToProducersBis < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :city_name, :string
    add_column :producers, :zip_code, :string
  end
end
