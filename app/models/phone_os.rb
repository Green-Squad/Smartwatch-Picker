class PhoneOs < ActiveRecord::Base
  has_many :log_keepers
  has_many :supported_oses
  has_many :smartwatches, through: :supported_oses
end
