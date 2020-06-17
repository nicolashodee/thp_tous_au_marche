# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#settings for the mailer
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_LOGIN'],
  :password => ENV['SENDGRID_PWD'],
  :domain => 'nicolashodee.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}