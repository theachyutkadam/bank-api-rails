# == Schema Information
#
# Table name: particulars
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :bigint           not null
#  receiver_id :bigint           not null
#  sender_id   :bigint           not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
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
  belongs_to :card
  belongs_to :sender, class_name: 'UserInformation'
  belongs_to :receiver, class_name: 'UserInformation'

  has_many :salaries

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
    card_status = card.status.capitalize
    errors.add(:card_id, "Your card is #{card_status}") if card.status != 'active'
  end

  def check_limit
    errors.add(:amount, "Maximum transaction limit is: #{Customer::AMOUNT_LIMIT}") if amount > Customer::AMOUNT_LIMIT
  end
end
