class UserMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def welcome_email(user)
    #we get the user instance so we can pass it on to the view via @user
    @user = user

    #we define an @url variable that we'll use in the e-mail view
    @url  = 'https://allons-tous-au-marche.herokuapp.com/login'

    #it is this call to mail() that allows us to send the e-mail by defining recipient and subject.
    make_bootstrap_mail(to: @user.email, subject: 'Bienvenue sur votre espace utilisateur TOUS AU MARCHE !')
  end

  def goodbye_email(user)
    @user = user
    @url  = 'https://allons-tous-au-marche.herokuapp.com'
    make_bootstrap_mail(to: @user.email, subject: 'On se revoit bientôt ?')
  end

end
