# == Schema Information
#
# Table name: nominees
#
#  id          :bigint           not null, primary key
#  contact     :string
#  first_name  :string
#  gender      :integer
#  last_name   :string
#  middle_name :string
#  relation    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_nominees_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class Nominee < ApplicationRecord
  belongs_to :customer

  has_one :address, as: :addressable

  enum gender: { male: 0, female: 1, transgender: 2 }
  enum relation: { mother: 0, father: 1, wife: 2, child: 3 }

  validates :contact,
            :first_name,
            :last_name,
            :gender,
            :middle_name,
            presence: true

  validates :gender, inclusion: { in: genders.keys }
  validates :relation, inclusion: { in: relations.keys }
  validates :contact, numericality: true, length: { is: 10 }
end
