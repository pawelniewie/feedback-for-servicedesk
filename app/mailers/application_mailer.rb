class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: 'customer-feedback@' + Rails.application.secrets.mail_domain
  layout 'mailer'
end

