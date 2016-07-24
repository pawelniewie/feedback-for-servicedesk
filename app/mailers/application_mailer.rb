class ApplicationMailer < ActionMailer::Base
  default from: 'pawel@' + ENV['MAILGUN_DOMAIN']
  layout 'mailer'
end

