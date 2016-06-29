class CallbackController < ApplicationController
  def handle
    # File.open(Rails.root.join('payload.json'), 'w') do |file|
    #   file.write(params[:issue].to_json)
    # end

    promoter = Promoter::Client.new(Rails.application.secrets.promoter_key)
    promoter.contact.create(email: params[:issue][:fields][:reporter][:emailAddress], # required
                            first_name: params[:issue][:fields][:reporter][:displayName],
                            send: true)
  end
end
