class AddIndextoProducers < ActiveRecord::Migration[5.2]
 def change
  add_reference :producers, :city, foreign_key: true
 end
end
