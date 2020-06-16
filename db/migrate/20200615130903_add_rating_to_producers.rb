class AddRatingToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :rating, :float
  end
end
