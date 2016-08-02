module Servicedesk
  class ResultsController < ApplicationController
    def create
      File.open(Rails.root.join('payload.json'), 'w') do |file|
        file.write(params[:issue].to_json)
      end

      project_configuration ||= ProjectConfiguration.find_by(project_id: params[:issue][:fields][:project][:id].to_i)

      SurveyMailer.give_feedback(project_configuration, params[:issue]).deliver_later

      head :no_content
    end
  end
end