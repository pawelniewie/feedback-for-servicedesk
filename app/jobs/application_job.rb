class ApplicationJob < ActiveJob::Base
  queue_as 'customer-feedback'
end
