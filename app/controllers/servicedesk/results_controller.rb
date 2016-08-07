module Servicedesk
  class ResultsController < ApplicationController
    def create
      issue = params[:issue]

      if issue_is_done? (issue)
        payload = IssuePayload.create!(payload: issue)

        SendFeedbackRequestJob.set(wait: rand(10..14).minutes).perform_later(payload.id)
      end

      head :no_content
    end

    def issue_is_done?(issue)
      issue.dig(:fields, :status, :statusCategory, :key) == 'done'
    end
  end
end