class SendFeedbackRequestJob < ApplicationJob
  def perform(issue_payload_id)
    payload = IssuePayload.find(issue_payload_id).payload.with_indifferent_access

    project_configuration = ProjectConfiguration.find_by!(project_id: payload[:fields][:project][:id].to_i)

    SurveyMailer.give_feedback(project_configuration, payload).deliver
  end
end
