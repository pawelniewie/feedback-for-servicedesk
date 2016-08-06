module Typeform
  class ResultsController < ApplicationController
    include ActionController::RespondWith

    respond_to :json

    def create
      payload = TypeformPayload.find_or_create_by!(event_id: params[:event_id]) do |tf|
        tf.payload = params.to_json
      end

      if payload.new_record?
        AddCommentToServiceDeskJob.perform_later(payload.id)
      end

      head :no_content
    end
  end
end
