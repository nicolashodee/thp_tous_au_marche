class ContactMailer < ApplicationMailer

  default from: 'webmaster@nicolashodee.com'

  def contact_message(contact)
    @contact = contact
    mail to: "webmaster@nicolashodee.com", subject: contact.subject
  end
end