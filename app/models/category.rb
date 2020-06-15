class Category < ApplicationRecord
	has_many :join_table_product_category
	has_many :producers, through: :join_table_product_category
end
