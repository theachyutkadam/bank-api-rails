# == Schema Information
#
# Table name: particulars
#
#  id          :uuid             not null, primary key
#  amount      :float            not null
#  deleted_at  :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :uuid             not null
#  receiver_id :uuid             not null
#  sender_id   :uuid             not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
#  index_particulars_on_deleted_at   (deleted_at)
#  index_particulars_on_receiver_id  (receiver_id)
#  index_particulars_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#  fk_rails_...  (receiver_id => user_informations.id)
#  fk_rails_...  (sender_id => user_informations.id)
#
class Particular < ApplicationRecord
  acts_as_paranoid
  belongs_to :card
  belongs_to :sender, class_name: 'UserInformation'
  belongs_to :receiver, class_name: 'UserInformation'

  has_many :salaries, dependent: :destroy

  validates :amount, presence: true

  validate :validate_amount, :check_card_status, :check_limit

  def validate_amount
    sender = self.sender.accountable
    if sender.instance_of?(::Employee)
      errors.add(:amount, 'Insuficiant balance') if sender.customer.current_balance < amount
    elsif sender.current_balance < amount
      errors.add(:amount, 'Insuficiant balance')
    end
  end

  def check_card_status
    errors.add(:card_id, "is #{card.status.capitalize}") if card.status != 'active'
  end

  def check_limit
    unless sender.user.is_admin?
      errors.add(:amount, "Maximum transaction limit is: #{Customer::AMOUNT_LIMIT}") if amount > Customer::AMOUNT_LIMIT
    end
  end

  def update_current_balance(sender_id, receiver_id, amount)
    sender_accountable = UserInformation.find(sender_id).accountable
    receiver_accountable = UserInformation.find(receiver_id).accountable

    sender_accountable = sender_accountable.customer if sender_accountable.class.name == "Employee"
    receiver_accountable = receiver_accountable.customer if receiver_accountable.class.name == "Employee"

    sender_accountable.update(current_balance: sender_accountable.current_balance - amount.to_f)
    receiver_accountable.update(current_balance: receiver_accountable.current_balance + amount.to_f)
  end
end
