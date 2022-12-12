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
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :expire_date, :csv, :customer, :status, :is_deleted, :pin
end
