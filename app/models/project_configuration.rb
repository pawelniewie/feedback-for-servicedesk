class ProjectConfiguration < ApplicationRecord
  belongs_to :jwt_token

  validates :jwt_token, presence: true

  validates :project_id, presence: true, numericality: { greater_than: 0 }
  validates :language, presence: true, inclusion: { in: ['en'] }
  validates :reply_to, presence: true
  validates :from, presence: true
  validates :subject, presence: true

  after_initialize :defaults, if: :new_record?

  def to_param
    project_id.to_s
  end

  private

  def defaults
    self.subject ||= 'Satisfaction survey'
  end
end
