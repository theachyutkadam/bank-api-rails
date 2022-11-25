class Nominee < ApplicationRecord
  belongs_to :address

  has_one :customer
end
