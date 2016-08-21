class NpsConfigurationsController < ApplicationController
  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action only: [:show] do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  def show
  end
end
