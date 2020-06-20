class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :ratings
  has_one_attached :avatar_user

  has_many :comments
  has_many :favorite_producers
  has_many :favorites, through: :favorite_producers, source: :producer

  validates :phone_number, if: :phone_number_nil?,
    length: { is: 10 },
    format: { with: /\d[0-9]\)*\z/ , message: "doit être au format : 0601020304 (pas d'espace)"}

  private

  def phone_number_nil?
    phone_number != nil
  end

  ### Sending an email when a user is created
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # sending an email when a user is deleted
  before_destroy :goodbye_send
  def goodbye_send
    UserMailer.goodbye_email(self).deliver_now
  end

  before_destroy :goodbye_send
  def goodbye_send
    UserMailer.goodbye_email(self).deliver_now
  end

end
