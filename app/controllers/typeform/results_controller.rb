module Typeform
  class ResultsController < ApplicationController
    include ActionController::RespondWith

    respond_to :json

    def create
      TypeformPayload.transaction do
        payload = TypeformPayload.find_or_initialize_by(event_id: params[:event_id]) do |tf|
          tf.payload = params
        end

        if payload.new_record?
          payload.save!
          AddCommentToServiceDeskJob.perform_later(payload.id)
        end
      end

      head :no_content
    end
  end
end
