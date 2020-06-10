class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private

  ### Sending an email when a producer is created
  after_create :welcome_send
  def welcome_send
    ProducerMailer.welcome_email(self).deliver_now
  end
  
end
