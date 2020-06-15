class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private 

  ### Sending an email when a user is created
  # after_create :welcome_send
  # def welcome_send
  #   UserMailer.welcome_email(self).deliver_now
  # end

  ### sending an email when a user is deleted
  # before_destroy :goodbye_send
  # def goodbye_send
  #   UserMailer.goodbye_email(self).deliver_now
  # end
  
end
