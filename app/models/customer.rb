class Customer < ApplicationRecord
  belongs_to :nominee
  belongs_to :account_type
  belongs_to :address
end
