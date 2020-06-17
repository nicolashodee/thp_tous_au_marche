class Contact  
  include ActiveModel::Validations
  include ActiveModel::Conversion

  CONTACT_ATTRIBUTES = [:email, :subject, :message]
  CONTACT_ATTRIBUTES.each do |attr|
    attr_accessor attr
  end

  validates :email, :subject, :message,
  presence: true, allow_blank: false

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def send_message
    ContactMailer.contact_message(self).deliver_now
  end
end