class TypeformPayload < ActiveRecord::Base
  validates :event_id, presence: true
  validates :payload, presence: true
end