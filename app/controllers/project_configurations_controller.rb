class ProjectConfigurationsController < ApplicationController
  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action only: [:edit, :update] do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  before_action :load_project_configuration

  def edit
    @project_configuration ||= create_project_configuration
  end

  def update
    if @project_configuration.update(params.require(:project_configuration)
                    .permit([:product_name, :language, :reply_to, :from, :subject, :introduction]))

      SurveyMailer.test_feedback(current_jwt_user, @project_configuration).deliver_later if params[:send_test].to_s == 'true'

      redirect_to edit_project_configuration_url(@project_configuration, jwt: params[:jwt]), notice: 'Configuration was saved!'
    else
      render action: 'edit'
    end
  end

  def load_project_configuration
    @project_configuration ||= current_jwt_auth.project_configurations.find_by(params.permit(:project_id))
  end

  private

  def create_project_configuration
    if current_jwt_user.jwt_user_info.blank?
      response = jira_gateway.user(current_jwt_user.user_key)
      if response.success?
        user = response.parsed_response

        JwtUserInfo.create!(jwt_user_id: current_jwt_user.id,
                            email: user['emailAddress'],
                            time_zone: user['timeZone'])

        current_jwt_user.reload
      else
        return head :precondition_failed
      end
    end

    configuration = ProjectConfiguration.new(jwt_token: current_jwt_auth, project_id: params[:project_id],
                             from: current_jwt_user.display_name,
                             reply_to: current_jwt_user.jwt_user_info.email)

    configuration.save!(validate: false)

    configuration
  end

  def jira_gateway
    JiraGateway.new(current_jwt_auth)
  end
end