class TransactionUser < ApplicationRecord
  belongs_to :transaction
  belongs_to :sender
  belongs_to :receiver
end
