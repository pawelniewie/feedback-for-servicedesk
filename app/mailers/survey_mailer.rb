class SurveyMailer < ApplicationMailer

  def give_feedback(project_configuration, issue)
    @reporter_email = issue[:fields][:reporter][:emailAddress]
    @first_name = issue[:fields][:reporter][:displayName]
    @issue = issue
    @survey_url = 'https://test.pl'
    @subject = "Please share your feedback on [#{@issue[:key]} #{@issue[:fields][:summary]}]"

    mail(to: @reporter_email, subject: @subject, template_name: 'give_feedback')
  end

  def test_feedback(jwt_user, project_configuration)
    give_feedback(project_configuration, {
      fields: {
        reporter: {
          email: jwt_user.jwt_user_info.email,
          displayName: jwt_user.display_name
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access)
  end

end
