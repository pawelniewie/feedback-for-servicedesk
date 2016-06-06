module PluginKeyService

	PLUGIN_KEY = 'nps-for-jira-servicedesk' + (Rails.env.production? ? '' :  '.' + Rails.env)

end