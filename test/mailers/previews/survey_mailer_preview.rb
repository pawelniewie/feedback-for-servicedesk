class SurveyMailerPreview < ActionMailer::Preview
  def give_feedback
    issue = JSON.parse(Rails.root.join('test/mailers/previews/issue_payload.json').read).with_indifferent_access
    project_configuration = OpenStruct.new(subject: 'Test')
    SurveyMailer.give_feedback(project_configuration, issue)
  end
end