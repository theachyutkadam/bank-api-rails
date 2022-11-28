class TransactionDetail < ApplicationRecord
  belongs_to :transaction
  belongs_to :sender, class_name: "Customer"
  belongs_to :sender, class_name: "Customer"
  # belongs_to :sender, class_name: "Customer"
  # belongs_to :receiver, class_name: "Customer"
end
