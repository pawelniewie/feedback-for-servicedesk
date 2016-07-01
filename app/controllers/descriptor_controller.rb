class DescriptorController < ApplicationController

	def show
		render :show, locals: {
			base_url: 'https://' + Rails.application.secrets.http_host,
			plugin_key: PluginKeyService::PLUGIN_KEY,
      client_id: Rails.application.secrets.client_id,
			plugin_name: 'Surveys for JIRA Service Desk' + (Rails.env.production? ? '' : ' [Development]')
		}
	end

end
