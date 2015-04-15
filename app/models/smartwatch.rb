class Smartwatch < ActiveRecord::Base
  has_many :supported_os
  has_many :phone_os, through: :supported_os
end
