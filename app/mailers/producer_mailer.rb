class ProducerMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'
 
  def welcome_email(producer)
    #we get the user instance so we can pass it on to the view via @user
    @producer = producer 
    #we define an @url variable that we'll use in the e-mail view
    @url  = 'https://tous-au-marche.herokuapp.com/login' 
    make_bootstrap_mail(to: @producer.email, subject: 'Bienvenue sur votre espace producteur TOUS AU MARCHE !')
  end

  def goodbye_email(producer)
    @producer = producer 
    @url  = 'https://tous-au-marche.herokuapp.com' 
    make_bootstrap_mail(to: @producer.email, subject: 'On se revoit bientôt ?') 
  end
  
end