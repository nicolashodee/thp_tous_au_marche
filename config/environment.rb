# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#### Mailer settings ####
config.action_mailer.perform_deliveries = true
config.action_mailer.default_url_options = { :host => 'https://tous-au-marche.herokuapp.com/' } 
config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
:user_name => ENV['SENDGRID_USERNAME'],
:password => ENV['SENDGRID_PASSWORD'],
:domain => 'heroku.com',
:address => 'smtp.sendgrid.net',
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}
#### end of Mailer ####