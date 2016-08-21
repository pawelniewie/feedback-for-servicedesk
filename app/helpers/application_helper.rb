module ApplicationHelper
  include AtlassianJwtAuthentication

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

  def body_class
    [controller_name, action_name].join('-')
  end

  def connect_loader_url
    params[:xdm_e] + params[:cp] + '/atlassian-connect/all.js'
  end
end
