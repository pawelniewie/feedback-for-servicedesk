module PluginKeyService

	PLUGIN_KEY = 'customer-feedback-for-jira-servicedesk-cloud' + (Rails.env.production? ? '' :  '.' + Rails.env)

end