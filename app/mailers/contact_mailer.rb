class ContactMailer < ApplicationMailer
  def contact_message(contact)
    @contact = contact
    mail to: "webmaster@nicolashodee.com", subject: contact.subject
  end
end