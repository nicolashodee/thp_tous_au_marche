class AddLongitudeLatitudeToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :longitude, :decimal
    add_column :producers, :latitude, :decimal
  end
end
