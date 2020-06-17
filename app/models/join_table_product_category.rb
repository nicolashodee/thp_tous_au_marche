class JoinTableProductCategory < ApplicationRecord
	belongs_to :category
	belongs_to :producer
end
