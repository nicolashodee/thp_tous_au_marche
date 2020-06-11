class CreateJoinTableProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_product_categories do |t|
		t.belongs_to :category, index: true
    	t.belongs_to :producer, index: true
      t.timestamps
    end
  end
end
