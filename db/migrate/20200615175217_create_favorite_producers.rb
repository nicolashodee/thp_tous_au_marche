class CreateFavoriteProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_producers do |t|
      t.integer :producer_id
      t.integer :user_id
      t.timestamps
    end
  end
end
