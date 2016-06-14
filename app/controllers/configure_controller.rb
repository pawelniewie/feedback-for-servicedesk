class ConfigureController < ApplicationController

  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action only: [:show, :save] do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  before_action :find_settings

  def show
    render :show, locals: {
        session_token: create_session_token,
        base_url: current_jwt_auth.base_url,
        promoter_token: @settings.promoter_token
    }
  end

  def save
    @settings.promoter_token=params[:promoter_token]
    @settings.save
  end

  private

  def create_session_token
    issued_at = Time.now.utc.to_i

    JWT.encode({
                   iss: current_jwt_auth.client_key,
                   iat: issued_at,
                   aud: [current_jwt_auth.addon_key],
                   context: {
                       user: {
                           userKey: current_jwt_user.user_key,
                           username: current_jwt_user.name,
                           displayName: current_jwt_user.display_name
                       }
                   }
               }, current_jwt_auth.shared_secret)
  end

  def find_settings
    @settings ||= JwtUserSettings.find_by_jwt_user_id(current_jwt_user.id)
    @settings ||= JwtUserSettings.create(jwt_user_id: current_jwt_user.id)
  end

end