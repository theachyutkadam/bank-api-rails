# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer
#  expire_date :datetime
#  is_deleted  :boolean
#  number      :bigint
#  pin         :integer
#  status      :integer
#  title       :string
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
  has_many :transactions

  enum status: { active: 0, inactive: 1, pending: 2 }, _default: 'inactive'
  enum title: { debit: 'debit', credit: 'credit' }, _default: 'debit'

  validates :csv, :expire_date, :number, :pin, :title, presence: true
  validates :status, inclusion: { in: statuses.keys }

  validates :number, uniqueness: true, numericality: true
  validates :number, length: { is: 16 }
  validates :csv, length: { is: 3 }
  validates :pin, length: { is: 4 }

  def generate_card
    self.csv = rand(111..999)
    self.pin = rand(1111..9999)
    self.number = rand(10**16)
    self.expire_date = Date.today + 5.years
  end
end
