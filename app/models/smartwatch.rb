class Smartwatch < ActiveRecord::Base
  has_many :supported_oses
  has_many :phone_oses, through: :supported_oses
end
