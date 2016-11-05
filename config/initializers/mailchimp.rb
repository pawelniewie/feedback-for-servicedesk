Gibbon::Request.api_key = Rails.application.secrets.mailchimp_key
Gibbon::Request.timeout = 15
Gibbon::Request.logger = Rails.logger