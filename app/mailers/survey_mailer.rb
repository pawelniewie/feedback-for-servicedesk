class SurveyMailer < ApplicationMailer

  def give_feedback(project_configuration, issue)
    @reporter_email = issue[:fields][:reporter][:emailAddress]
    @first_name = issue[:fields][:reporter][:displayName]
    @issue = issue
    @issue_key = issue[:key]
    @issue_summary = issue[:fields][:summary]
    @client_id =
    @survey_url = survey_url(@issue_key, @issue_summary, @reporter_email, project_configuration.jwt_token.id)
    @subject = "Please share your feedback on [#{@issue_key} #{@issue_summary}]"

    mail(to: %|"#{@first_name}" <#{@reporter_email}>|,
      subject: @subject,
      template_name: 'give_feedback',
      reply_to: %|"#{project_configuration.from}" <#{project_configuration.reply_to}>|)
  end

  def survey_url(issue_key, issue_summary, recipient_email, client_id)
    base_url = Rails.application.secrets.survey_url
    base_url += "?issue_key=#{CGI::escape(issue_key)}"
    base_url += "&issue_summary=#{CGI::escape(issue_summary)}"
    base_url += "&recipient_email=#{CGI::escape(recipient_email)}"
    base_url += "&client_id=#{client_id.to_i}"
    base_url
  end

  def test_feedback(jwt_user, project_configuration)
    issue = JSON.parse(Rails.root.join('test/mailers/previews/issue_payload.json').read).with_indifferent_access
    give_feedback(project_configuration, issue)
  end

end
