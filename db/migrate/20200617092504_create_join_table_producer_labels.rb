class CreateJoinTableProducerLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_producer_labels do |t|
      t.belongs_to :producer, index: true
      t.belongs_to :label, index: true

      t.timestamps
    end
  end
end
