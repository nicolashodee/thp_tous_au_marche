class ContactMailer < ApplicationMailer

  default from: 'no-reply@tousaumarche.com'

  def contact_message(contact)
    @contact = contact
    mail to: "webmaster@nicolashodee.com", subject: contact.subject
    # make_bootstrap_mail(to: @user.email, subject: 'Bienvenue sur votre espace utilisateur TOUS AU MARCHE !')
  end
end
