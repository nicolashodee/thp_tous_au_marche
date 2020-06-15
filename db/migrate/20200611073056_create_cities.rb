class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.integer :zip_code

      t.timestamps
    end
  end
end
