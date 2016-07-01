module ApplicationHelper
  include AtlassianJwtAuthentication

  def tenant_base_url
    current_jwt_auth.base_url
  end
end
