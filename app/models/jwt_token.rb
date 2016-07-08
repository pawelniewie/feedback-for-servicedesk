class JwtToken < ActiveRecord::Base
  has_many :jwt_users, dependent: :destroy
  has_many :project_configurations, dependent: :destroy
end
