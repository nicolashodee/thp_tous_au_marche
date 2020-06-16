class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :producer
  validates :content, presence: true
end
