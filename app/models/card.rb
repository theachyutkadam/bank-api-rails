# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  active_at   :datetime
#  blocked_at  :datetime
#  closed_at   :datetime
#  csv         :integer          not null
#  deleted_at  :datetime
#  expire_date :datetime         not null
#  inactive_at :datetime
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          default("inactive"), not null
#  title       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#  index_cards_on_deleted_at   (deleted_at)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#
class Card < ApplicationRecord
  include AASM
  acts_as_paranoid
  belongs_to :customer
  has_many :transactions, dependent: :destroy

  enum status: { active: 0, inactive: 1, blocked: 2, closed: 3 }, _default: 'inactive'
  enum title: { debit: 0, credit: 1 }, _default: 'debit'

  validates :csv, :expire_date, :number, :pin, :title, presence: true
  validates :status, inclusion: { in: statuses.keys }

  validates :number, uniqueness: true, numericality: true
  validates :number, length: { is: 12 }
  validates :csv, length: { is: 3 }
  validates :pin, length: { is: 4 }

  before_validation :set_card_details, on: :create

  aasm :status, timestamps: true do
    state :inactive, initial: true
    state :active, :blocked, :closed

    event :activate do
      transitions from: %i[inactive], to: :active
    end

    event :block do
      transitions from: :active, to: :blocked
    end

    event :close do
      transitions from: %i[active inactive blocked], to: :closed
    end
  end

  def set_card_details
    self.csv ||= rand(100..999)
    self.pin ||= rand(1000..9999)
    self.number ||= generate_number
    self.expire_date ||= Date.today + 5.years
  end

  def generate_number
    card_number = rand(100_000_000_000..999_999_999_999)
    is_exits(card_number)
  end

  def is_exits(card_number)
    if Card.where(number: card_number).any?
      generate_number
    else
      card_number
    end
  end

  def user_information
    customer.user_information
  end
end
