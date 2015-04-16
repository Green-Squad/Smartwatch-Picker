class PhoneOs < ActiveRecord::Base
  has_many :supported_oses
  has_many :smartwatches, through: :supported_oses
end
