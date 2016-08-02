class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: 'pawel@' + ENV['MAILGUN_DOMAIN']
  layout 'mailer'
end

