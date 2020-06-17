class AddLatandlonToProducer < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :latitude, :decimal
    add_column :producers, :longitude, :decimal
  end
end
