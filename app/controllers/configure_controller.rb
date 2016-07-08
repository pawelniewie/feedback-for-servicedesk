class ConfigureController < ApplicationController

  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action only: [:show, :save] do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  before_action :find_settings

  def edit
    render :show, locals: {
        base_url: current_jwt_auth.base_url,
        promoter_token: @settings.promoter_token
    }
  end

  def save
    @settings.promoter_token=params[:promoter_token]
    @settings.save
  end

  private

  def find_settings
    @settings ||= JwtUserSettings.find_by_jwt_user_id(current_jwt_user.id)
    @settings ||= JwtUserSettings.create(jwt_user_id: current_jwt_user.id)
  end

end