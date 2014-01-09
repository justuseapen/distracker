# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Distracker::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app20846703@heroku.com'],
  :password       => ENV['eswmeadr'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}