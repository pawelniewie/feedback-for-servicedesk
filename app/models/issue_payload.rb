class IssuePayload < ApplicationRecord
  validates :payload, presence: true
end
