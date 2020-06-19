class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :join_table_product_categories
  has_many :categories, through: :join_table_product_category
  has_one_attached :avatar
  has_many_attached :images
  has_many :comments
  
  # returns the users that favorite a producer
  belongs_to :producer, optional: true
  has_many :favorite_producers  
  has_many :favorited_by, through: :favorite_producers, source: :user  
  has_many :ratings

  geocoded_by :geocode_address
  after_validation :geocode

  def geocode_address
    [address,city_name, zip_code].compact.join(', ')
  end

  def images=(array = [])
    array.each do |f|
      images.create image: f
    end
  end
  
  private

  ### Sending an email when a producer is created
  # after_create :welcome_send
  # def welcome_send
  #   ProducerMailer.welcome_email(self).deliver_now
  # end

  ### sending an email when a producer is deleted

  # before_destroy :goodbye_send
  # def goodbye_send
  #   ProducerMailer.goodbye_email(self).deliver_now
  # end

  # before_destroy :goodbye_send
  # def goodbye_send
  #   ProducerMailer.goodbye_email(self).deliver_now
  # end

end
