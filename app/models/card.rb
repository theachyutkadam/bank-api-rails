# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer          not null
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          default("inactive"), not null
#  title       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class Card < ApplicationRecord
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
  
  def set_card_details
    self.status ||= 1
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
end
