module Typeform
  class ResultsController < ApplicationController
    include ActionController::RespondWith

    respond_to :json

    def create
      TypeformPayload.create!(event_id: params[:event_id], payload: params.to_json)
    end
  end
end