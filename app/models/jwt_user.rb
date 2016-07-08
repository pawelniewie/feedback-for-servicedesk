class JwtUser < ActiveRecord::Base
  belongs_to :jwt_token
  has_one :jwt_user_setting
  has_one :jwt_user_info
end