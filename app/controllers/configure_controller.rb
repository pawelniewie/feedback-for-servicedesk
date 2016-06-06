class ConfigureController < ApplicationController

  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action only: [:show] do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  def show
    render :show, locals: {
        session_token: create_session_token,
        base_url: current_jwt_auth.base_url
    }
  end

  def save

  end

  private

  def create_session_token
    issued_at = Time.now.utc.to_i

    JWT.encode({
                   iss: current_jwt_auth.client_key,
                   iat: issued_at,
                   aud: [current_jwt_auth.addon_key]
               }, current_jwt_auth.shared_secret)
  end

end