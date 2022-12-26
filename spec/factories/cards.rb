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
#  status      :integer          not null
#  title       :string           not null
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
FactoryBot.define do
  factory :card do
    status { Card.statuses.keys.sample }
    title { Card.titles.keys.sample }
    is_deleted { false }
  end
end
