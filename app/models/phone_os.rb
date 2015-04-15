class PhoneOs < ActiveRecord::Base
  has_many :supported_os
  has_many :smartwatch, through: :supported_os
end
