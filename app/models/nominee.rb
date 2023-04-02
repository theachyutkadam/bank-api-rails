# frozen_string_literal: true

# == Schema Information
#
# Table name: nominees
#
#  id          :uuid             not null, primary key
#  contact     :string           not null
#  deleted_at  :datetime
#  first_name  :string           not null
#  gender      :integer          not null
#  last_name   :string           not null
#  middle_name :string           not null
#  relation    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_nominees_on_customer_id  (customer_id)
#  index_nominees_on_deleted_at   (deleted_at)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class Nominee < ApplicationRecord
  acts_as_paranoid
  belongs_to :customer
  delegate :user_information, to: :customer

  has_one :address, as: :addressable, dependent: :destroy

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
  validates :customer_id, :contact, uniqueness: true
end
