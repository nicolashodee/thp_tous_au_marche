class Label < ApplicationRecord
  has_many :join_table_producer_labels
  has_many :producers, through: :join_table_producer_labels
end
