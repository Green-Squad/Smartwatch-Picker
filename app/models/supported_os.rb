class SupportedOs < ActiveRecord::Base
  belongs_to :phone_os
  belongs_to :smartwatch
end
