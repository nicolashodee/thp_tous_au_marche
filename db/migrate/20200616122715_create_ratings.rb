class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.float :rating
      t.belongs_to :user, index: true
      t.belongs_to :producer, index: true

      t.timestamps
    end
  end
end
