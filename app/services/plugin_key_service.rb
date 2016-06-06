module PluginKeyService

	PLUGIN_KEY = 'customer-feedback-for-servicedesk-cloud' + (Rails.env.production? ? '' :  '.' + Rails.env)

end