class AddCommentToServiceDeskJob < ApplicationJob
  def perform(typeform_payload_id)
    @payload = TypeformPayload.find(typeform_payload_id).payload.with_indifferent_access
    @jwt_auth = JwtToken.find(@payload[:form_response][:hidden][:client_id])

    jira = JiraGateway.new(@jwt_auth)
    jira.internal_comment(@payload[:form_response][:hidden][:issue_key], comment)
  end

  private

  def comment
    answers = @payload[:form_response][:answers]
    rating = answers.select { |a| a[:field][:type] == 'rating' }.first
    comment = answers.select { |a| a[:field][:type] == 'long_text' }.first

    r = "User rated this interaction as *#{rating[:number]}*\n"
    if comment.present?
      r += "\nAnd wrote:\n"
      r += "{quote}"
      r += comment[:text]
      r += "{quote}\n"
    end
    r
  end
end
