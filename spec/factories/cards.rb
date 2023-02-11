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
FactoryBot.define do
  factory :card do
    status { Card.statuses.keys.sample }
    title { Card.titles.keys.sample }
    is_deleted { false }
  end
end
