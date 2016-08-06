class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: 'customer-feedback@' + ENV['MAILGUN_DOMAIN']
  layout 'mailer'
end

