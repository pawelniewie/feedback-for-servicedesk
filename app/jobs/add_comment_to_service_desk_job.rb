class AddCommentToServiceDeskJob < ApplicationJob
  def perform(typeform_payload_id)
    @payload = TypeformPayload.find(typeform_payload_id).payload.with_indifferent_access
    @jwt_auth = JwtToken.find(@payload[:form_response][:hidden][:client_id])
    @issue_key = @payload[:form_response][:hidden][:issue_key]

    jira = JiraGateway.new(@jwt_auth)
    jira.internal_comment(@issue_key, create_comment)
    jira.entity(@issue_key, 'customer-feedback', {
      rating: rating,
      comment: comment
    })
  end

  private

  def comment
    answers = @payload[:form_response][:answers]
    comment = answers.select { |a| a[:field][:type] == 'long_text' }.first
    if comment.present?
      comment[:text]
    else
      nil
    end
  end

  def rating
    answers = @payload[:form_response][:answers]
    rating = answers.select { |a| a[:field][:type] == 'rating' }.first
    if rating.present?
      rating[:number]
    else
      nil
    end
  end

  def create_comment
    r = "User rated this interaction as *#{rating}*\n"
    if comment.present?
      r += "\nAnd wrote:\n"
      r += "{quote}"
      r += comment
      r += "{quote}\n"
    end
    r
  end
end
